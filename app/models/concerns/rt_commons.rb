module RtCommons
  extend ActiveSupport::Concern

  included do

    has_one :request_form, as: :rt_extendable, required: true
    accepts_nested_attributes_for :request_form

    validate :check_request_type
    after_initialize :build_new_request_form

    private

    def request_type_valid?
      self.class.model_name.singular == request_form&.request_type&.kind
    end

    def check_request_type
      errors.add(:base, :invalid_request_type) unless request_type_valid?
    end

    def build_new_request_form(attributes = {})
      return if persisted? || request_form
      attributes.reverse_merge!(
        request_type: RequestType.where(kind: RequestType.kinds[self.class.model_name.singular]).take
      )
      build_request_form(attributes)
    end

    def check_request_form_references
      if has_request_form_references?
        errors.add :base, :unable_to_delete_due_to_request_form_references
        false
      end
    end

    def has_request_form_references?
      RequestForm.where(rt_extendable_id: id, rt_extendable_type: self.class.name).exists?
    end

  end
end