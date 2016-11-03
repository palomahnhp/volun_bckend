module Archivable
  extend ActiveSupport::Concern

  included do

    def archived?
      !active?
    end

    def archive
      update_attribute(:active, false)
      self
    end

    alias_method :destroy, :archive

    def recover
      update_attribute(:active, true)
      self
    end

  end
end