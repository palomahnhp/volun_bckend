class RequestForm < ActiveRecord::Base

  enum status: [:pending, :processing, :approved, :rejected]

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type, required: true
  belongs_to :rejection_type
  belongs_to :request_reason
  belongs_to :user
  has_many :events, as: :eventable

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
