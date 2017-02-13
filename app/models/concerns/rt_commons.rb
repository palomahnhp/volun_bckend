module RtCommons
  extend ActiveSupport::Concern

  included do

    has_one :request_form, as: :rt_extendable, required: true
    accepts_nested_attributes_for :request_form

    validate :check_request_type
    after_initialize :build_new_request_form

    default_scope -> { includes(request_form: [:status, :manager]) }
    scope :with_statuses, ->(statuses = []){
      statuses = [statuses].flatten.compact.select{ |status| status.to_s.in? RequestForm.statuses.keys }
      return none unless statuses.any?
      where('request_forms.rt_extendable_type' => name,
            'request_forms.req_status_id' => statuses.map{ |status| RequestForm.get_status_id_by_kind(status) })
    }
    scope :with_status, ->(status){ with_statuses status }
    scope :pending,     ->(){ with_status(:pending) }
    scope :processing,  ->(){ with_status(:processing) }
    scope :approved,    ->(){ with_status(:approved) }
    scope :rejected,    ->(){ with_status(:rejected) }

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