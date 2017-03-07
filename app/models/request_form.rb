class RequestForm < ActiveRecord::Base

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type, required: true
  belongs_to :rejection_type, -> { where(active: true) }, class_name: 'Req::RejectionType', foreign_key: 'req_rejection_type_id'
  belongs_to :reason, class_name: 'Req::Reason', foreign_key: 'req_reason_id'
  belongs_to :status, class_name: 'Req::Status', foreign_key: 'req_status_id'
  belongs_to :user
  belongs_to :manager
  has_many :events, as: :eventable
  has_many :status_traces, :class_name => 'Req::StatusTrace'
  has_many :volun_trackings, :class_name => 'Volun::Tracking'
  has_many :ent_trackings, :class_name => 'Ent::Tracking'
  has_many :pro_trackings, :class_name => 'Pro::Tracking'

  accepts_nested_attributes_for :rt_extendable

  delegate :pending?, :processing?, :approved?, :rejected?, :kind_i18n, to: :status, allow_blank: true

  default_scope ->{ includes(:request_type) }
  scope :pending,    ->(){ where(req_status_id: get_status_id_by_kind(:pending)) }
  scope :processing, ->(){ where(req_status_id: get_status_id_by_kind(:processing)) }
  scope :approved,   ->(){ where(req_status_id: get_status_id_by_kind(:approved)) }
  scope :rejected,   ->(){ where(req_status_id: get_status_id_by_kind(:rejected)) }

  validates :req_rejection_type_id, presence: true, if: 'req_status_id_changed? && rejected?'
  validate :req_rejection_type_no_presence
  validate :permitted_status_change_flow, if: 'req_status_id_changed?'

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
      Req::Status.send(status).take.try :id
    end

    def status_names
      statuses.keys
    end
  end

  def pending!
    update_status!(:pending)
  end

  def processing!
    update_status!(:processing)
  end

  def approved!
    update_status!(:approved)
  end

  def rejected!
    update_status!(:rejected)
  end

  def update_status!(status_name)
    return unless status_name.to_s.in? self.class.status_names
    update!(status_date: DateTime.now, req_status_id: self.class.get_status_id_by_kind(status_name))
  end

  def status_i18n
    kind_i18n
  end

  alias_method :status_name_i18n, :status_i18n

  def status_name
    status.kind
  end

  def build_rt_extendable(attributes = {})
    return unless request_type.extendable?
    self.rt_extendable = rt_extendable_class.new(attributes.merge(request_form: self))
  end

  def update_and_trace_status(status_name, attributes = {})
    return true if status.kind == status_name.to_s && manager_id != attributes[:manager_id]

    if status_name.to_s.in? self.class.status_names
      attributes.merge!(
        status_date: DateTime.now,
        req_status_id: self.class.get_status_id_by_kind(status_name),
      )
      create_status_trace if update_attributes(attributes)
    else
      raise "Status name must be in #{self.class.status_names}"
    end
    errors.blank?
  end

  # Status traces creation must be ensured by default
  def create_status_trace(validate = false)
    status_trace = Req::StatusTrace.new(status: status, request_form: self, manager: manager)
    status_trace.save(validate: validate)
  end

  private

  def rt_extendable_class
    rt_extendable.try(:class) || request_type.kind.classify.sub(/\ARt/, 'Rt::').constantize
  end

  def req_rejection_type_no_presence
    if rejection_type.present? && !rejected?
      errors.add :req_rejection_type_id, :cannot_be_present_if_is_not_rejected
    end
  end

  def permitted_status_change_flow
    return add_status_error :cannot_change_from_approved if status_was?(:approved)

    case self
    when ->(rf){ rf.pending? }
      add_status_error :cannot_change_to_pending    unless can_change_to_pending?
    when ->(rf){ rf.processing? }
      add_status_error :cannot_change_to_processing unless status_was?(:pending)
    when ->(rf){ rf.approved? }
      add_status_error :cannot_change_to_approved   unless status_was?(:processing)
    when ->(rf){ rf.rejected? }
      add_status_error :cannot_change_to_rejected   unless status_was?(:processing)
    end
  end

  def add_status_error(error_name)
    errors.add :req_status_id, error_name
    nil
  end

  def status_was?(status_name)
    req_status_id_was == self.class.get_status_id_by_kind(status_name)
  end

  def can_change_to_pending?
    status_was?(:processing) || status_was?(:rejected) || req_status_id_was == nil
  end

end
