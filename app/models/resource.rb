class Resource < ActiveRecord::Base

  RESOURCES_NAMES = [
    AcademicLevel.name,
    Activity.name,
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
    Ent::Tracking.name,
    Entity.name,
    Event.name,
    EventType.name,
    FrontpageElement.name,
    FrontpagePosition.name,
    IdNumberType.name,
    InfoSource.name,
    Language.name,
    LanguageLevel.name,
    LanguageVolunteer.name,
    Link.name,
    Manager.name,
    Motivation.name,
    Nationality.name,
    NoticeType.name,
    Permission.name,
    Pro::Issue.name,
    Pro::Tracking.name,
    Profession.name,
    Profile.name,
    Project.name,
    Proposal.name,
    Province.name,
    Pt::Centre.name,
    Pt::Entity.name,
    Pt::Other.name,
    Pt::Permanent.name,
    Pt::Punctual.name,
    Pt::Social.name,
    Pt::Subvention.name,
    RecordHistory.name,
    Req::Reason.name,
    Req::RejectionType.name,
    Req::Status.name,
    Req::StatusTrace.name,
    RequestForm.name,
    RoadType.name,
    Role.name,
    Rt::ActivityPublishing.name,
    Rt::ActivityUnpublishing.name,
    Rt::EntitySubscribe.name,
    Rt::EntityUnsubscribe.name,
    Rt::Other.name,
    Rt::ProjectPublishing.name,
    Rt::ProjectUnpublishing.name,
    Rt::VolunteerAmendment.name,
    Rt::VolunteerAppointment.name,
    Rt::VolunteersDemand.name,
    Rt::VolunteerSubscribe.name,
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
    Volun::Tracking.name,
    Volunteer.name
  ]

  has_many :permissions
  has_many :managers

  validates name, inclusion: { in: RESOURCES_NAMES }

  def to_s
    name
  end

  def class_name
    name.to_s.safe_constantize
  end

end
