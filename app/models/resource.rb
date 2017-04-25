class Resource < ActiveRecord::Base

  DEFAULT_RESOURCES = [
    Activity.name,
    Entity.name,
    Ent::Tracking.name,
    Link.name,
    Project.name,
    Pro::Tracking.name,
    Pt::Subvention.name,
    Pt::Centre.name,
    Pt::Entity.name,
    Pt::Other.name,
    Pt::Permanent.name,
    Pt::Punctual.name,
    Pt::Social.name,
    RequestForm.name,
    Rt::VolunteerSubscribe.name,
    Rt::Other.name,
    Volunteer.name,
    Volun::Tracking.name,
  ]

  ALL_RESOURCES = [
    AcademicLevel.name,
    Address.name,
    Area.name,
    Collective.name,
    ContactResult.name,
    ContactType.name,
    Coordination.name,
    Degree.name,
    DegreeType.name,
    District.name,
    Document.name,
    EmploymentStatus.name,
    Event.name,
    EventType.name,
    FrontpageElement.name,
    FrontpagePosition.name,
    IdNumberType.name,
    InfoSource.name,
    Language.name,
    LanguageLevel.name,
    LanguageVolunteer.name,
    Manager.name,
    Motivation.name,
    Nationality.name,
    NoticeType.name,
    Permission.name,
    Pro::Issue.name,
    Profession.name,
    Profile.name,
    Proposal.name,
    Province.name,
    RecordHistory.name,
    Req::Reason.name,
    Req::RejectionType.name,
    Req::Status.name,
    Req::StatusTrace.name,
    RoadType.name,
    Role.name,
    Rt::ActivityPublishing.name,
    Rt::ActivityUnpublishing.name,
    Rt::EntitySubscribe.name,
    Rt::EntityUnsubscribe.name,
    Rt::ProjectPublishing.name,
    Rt::ProjectUnpublishing.name,
    Rt::VolunteerAmendment.name,
    Rt::VolunteerAppointment.name,
    Rt::VolunteersDemand.name,
    Rt::VolunteerUnsubscribe.name,
    Sector.name,
    Skill.name,
    Status.name,
    Timetable.name,
    TrackingType.name,
    Trait.name,
    UnsubscribeLevel.name,
    UnsubscribeReason.name,
    Volun::Assessment.name,
    Volun::Availability.name,
    Volun::Contact.name,
    Volun::KnownLanguage.name,
  ] + DEFAULT_RESOURCES

  include Archivable

  attr_accessor :alias_name

  has_many :permissions
  has_many :managers

  validates :name, inclusion: { in: ALL_RESOURCES }

  default_scope ->{ order('resources.description asc') }

  def self.ransack_default
    {s: 'description asc'}
  end

  def self.main_columns
    %i(alias_name name description active)
  end

  def alias_name
    class_name.model_name.human
  end

  def to_s
    name
  end

  def class_name
    name.to_s.safe_constantize
  end

end
