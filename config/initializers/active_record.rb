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

end