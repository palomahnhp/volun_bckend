module Archivable
  extend ActiveSupport::Concern

  included do

    default_scope ->{ where("#{self.table_name}.active" => true) }


    def destroy
      update_attribute(:active, false)
      self
    end

  end
end