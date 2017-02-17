class RequestForm < ActiveRecord::Base

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type, required: true
  belongs_to :rejection_type, class_name: 'Req::RejectionType', foreign_key: 'req_rejection_type_id'
  belongs_to :reason, class_name: 'Req::Reason', foreign_key: 'req_reason_id'
  belongs_to :status, class_name: 'Req::Status', foreign_key: 'req_status_id'
  belongs_to :user
  belongs_to :manager
  has_many :events, as: :eventable
  has_many :status_traces, :class_name => 'Req::StatusTrace'

  accepts_nested_attributes_for :rt_extendable

  delegate :pending?, :processing?, :approved?, :rejected?, :kind_i18n, to: :status, allow_blank: true

  scope :pending,    ->(){ where(req_status_id: get_status_id_by_kind(:pending)) }
  scope :processing, ->(){ where(req_status_id: get_status_id_by_kind(:processing)) }
  scope :approved,   ->(){ where(req_status_id: get_status_id_by_kind(:approved)) }
  scope :rejected,   ->(){ where(req_status_id: get_status_id_by_kind(:rejected)) }

  validates :req_rejection_type_id, presence: true, if: 'req_status_id_changed? && rejected?'
  validate :req_rejection_type_no_presence

  class << self
    delegate :kinds, :kinds_i18n, to: Req::Status

    def statuses_i18n
      kinds_i18n
    end

    def statuses
      kinds
    end

    def main_columns
      %i(
        request_type
        user
        status
        status_date
        reason
      )
    end

    def get_status_id_by_kind(status)
      Req::Status.send(status).take.id
    end

    def status_names
      statuses.keys
    end
  end

  def pending!
    update!(status: Req::Status.pending.take)
  end

  def processing!
    update!(status: Req::Status.processing.take)
  end

  def approved!
    update!(status: Req::Status.approved.take)
  end

  def rejected!
    update!(status: Req::Status.rejected.take)
  end

  def status_i18n
    kind_i18n
  end

  def build_rt_extendable(attributes = {})
    return unless request_type.extendable?
    self.rt_extendable = rt_extendable_class.new(attributes.merge(request_form: self))
  end

  def update_and_trace_status!(status_name, attributes = {})
    return if reload.status.kind == status_name.to_s
    if status_name.to_s.in? RequestForm.status_names
      update_columns(attributes.merge!(req_status_id: Req::Status.public_send(status_name).take.id))
      create_status_trace
    else
      raise "Status name must be in #{RequestForm.status_names}"
    end
    true
  end

  def create_status_trace(validate = false)
    status_trace = Req::StatusTrace.new(status: status, request_form: self, manager: manager)
    status_trace.save(validate: validate)
  end

  private

  def rt_extendable_class
    rt_extendable.try(:class) || request_type.kind.classify.sub(/\ARt/, 'Rt::').constantize
  end

  def req_rejection_type_no_presence
    unless rejected?
      errors.add :rejection_type_id, :cannot_be_present_if_is_not_rejected
    end
  end

end
