class RequestForm < ActiveRecord::Base

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type, required: true
  belongs_to :rejection_type
  belongs_to :req_reason, :class_name => 'Req::Reason'
  belongs_to :req_status, :class_name => 'Req::Status'
  belongs_to :user
  has_many :events, as: :eventable
  has_many :req_status_traces, :class_name => 'Req::StatusTrace'

  accepts_nested_attributes_for :rt_extendable

  def build_rt_extendable(attributes = {})
    return unless request_type.extendable?
    self.rt_extendable = rt_extendable_class.new(attributes.merge(request_form: self))
  end

  private

  def rt_extendable_class
    rt_extendable.try(:class) || request_type.kind.classify.sub(/\ARt/, 'Rt::').constantize
  end

end
