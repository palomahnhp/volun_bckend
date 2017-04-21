# encoding: utf-8
class ActiveRecord::Base

  # SCAFFOLD ------------------------------------------------------------------

  def self.ransack_order_to_s
    'id'
  end

  def self.ransack_associated_order_to_s
    "#{self.name.underscore}_#{self.ransack_order_to_s}"
  end

  def self.ransack_default
    {s: "#{self.ransack_order_to_s} asc"}
  end

  def self.main_columns
    column_names.reject{ |column| column =~ /\b(id|created_at|updated_at)\b/ }
  end

  def self.to_csv(records = self.all)
    CSV.generate(:col_sep => ';') do |csv|
      csv << main_columns.map{ |column_name| human_attribute_name(column_name) }
      records.each do |record|
        csv << main_columns.map{ |column_name| record.public_send column_name }
      end
    end
  end

  def main_attributes
    self.class.main_columns
  end

end
