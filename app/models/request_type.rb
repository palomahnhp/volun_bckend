class RequestType < ActiveRecord::Base

  include Archivable

  # These values are used to set database constraints, so whether they change
  # or are removed or a new one is added, a new migration must be created
  # in order to ensure the rt_extendable consistency for the request_forms table

  enum kind: {
    rt_volunteer_subscribe:   1,
    rt_volunteer_unsubscribe: 2,
    rt_volunteer_amendment:   3,
    rt_volunteer_appointment: 4,
    rt_entity_subscribe:      5,
    rt_entity_unsubscribe:    6,
    rt_volunteers_demand:     7,
    rt_project_publishing:    8,
    rt_project_unpublishing:  9,
    rt_activity_publishing:   10,
    rt_activity_unpublishing: 11,
    rt_other:                 12
  }

  validates :kind, presence: true

  def extendable?
    kind.classify.sub(/\ARt/, 'Rt::').safe_constantize.present?
  end

  def to_s
    kind_i18n
  end


end
