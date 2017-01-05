class RequestForm < ActiveRecord::Base

  enum status: [:pending, :processing, :approved, :rejected]

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type, required: true
  belongs_to :rejection_type
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

  def rt_extendable_consistency
    rt_consistent =
      request_type_id == RequestType.kinds[:rt_volunteer_subscribe]   && rt_extendable_type == Rt::VolunteerSubscribe.name   ||
      request_type_id == RequestType.kinds[:rt_volunteer_unsubscribe] && rt_extendable_type == Rt::VolunteerUnsubscribe.name ||
      request_type_id == RequestType.kinds[:rt_volunteer_amendment]   && rt_extendable_type == Rt::VolunteerAmendment.name   ||
      request_type_id == RequestType.kinds[:rt_volunteer_appointment] && rt_extendable_type == Rt::VolunteerAppointment.name ||
      request_type_id == RequestType.kinds[:rt_entity_subscribe]      && rt_extendable_type == Rt::EntitySubscribe.name      ||
      request_type_id == RequestType.kinds[:rt_entity_unsubscribe]    && rt_extendable_type == Rt::EntityUnsubscribe.name    ||
      request_type_id == RequestType.kinds[:rt_volunteers_demand]     && rt_extendable_type == Rt::VolunteersDemand.name     ||
      request_type_id == RequestType.kinds[:rt_project_publishing]    && rt_extendable_type == Rt::ProjectPublishing.name    ||
      request_type_id == RequestType.kinds[:rt_project_unpublishing]  && rt_extendable_type == Rt::ProjectUnpublishing.name  ||
      request_type_id == RequestType.kinds[:rt_project_unsubscribe]   && rt_extendable_type == Rt::ProjectUnsubscribe.name   ||
      request_type_id == RequestType.kinds[:rt_activity_publishing]   && rt_extendable_type == Rt::ActivityPublishing.name   ||
      request_type_id == RequestType.kinds[:rt_activity_unpublishing] && rt_extendable_type == Rt::ActivityUnpublishing.name ||
      request_type_id == RequestType.kinds[:rt_other]                 && rt_extendable_type == Rt::Other.name
    errors.add(:rt_extendable_type, :rt_extendable_inconsistency) unless rt_consistent
  end

end
