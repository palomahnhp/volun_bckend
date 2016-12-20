class RequestType < ActiveRecord::Base

  include Archivable

  enum kind: {
    rt_volunteer_subscribe:    1,  # request_type_volunteer_subscribe
    rt_volunteer_unsubscribe:  1,  # request_type_volunteer_unsubscribe
    rt_volunteer_amendment:    1,  # request_type_volunteer_amendment
    rt_volunteer_appointment:  1,  # request_type_volunteer_appointment
    rt_entity_subscribe:       1,  # request_type_entity_subscribe
    rt_entity_unsubscribe:     1,  # request_type_entity_unsubscribe
    rt_volunteers_demand:      1,  # request_type_volunteers_demand
    rt_project_publishing:     1,  # request_type_project_publishing
    rt_project_unpublishing:   1,  # request_type_project_unpublishing
    rt_project_unsubscribe:    1,  # request_type_project_unsubscribe
    rt_activity_publishing:    1,  # request_type_activity_publishing
    rt_activity_unpublishing:  1,  # request_type_activity_unpublishing
    rt_other:                  1   # request_type_other
  }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.pt_extension_tables
    kinds.keys.select { |pt_extension| pt_extension.classify.safe_constantize }
  end

  def to_s
    kind_i18n
  end


end
