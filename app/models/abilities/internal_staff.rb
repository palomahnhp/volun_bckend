module Abilities
  class InternalStaff
    include CanCan::Ability

    def initialize(user)
      can :manage, AcademicLevel
      can :manage, Activity
      can :manage, Address
      can :manage, Area
      can :manage, Collective
      can :manage, ContactResult
      can :manage, ContactType
      can :manage, Coordination
      can :manage, Degree
      can :manage, DegreeType
      can :manage, District
      can :manage, Document
      can :manage, EmploymentStatus
      can :manage, Ent::Tracking
      can :manage, Entity
      can :manage, EntityType
      can :manage, Event
      can :manage, EventType
      can :manage, FrontpageElement
      can :manage, FrontpagePosition
      can :manage, IdNumberType
      can :manage, InfoSource
      can :manage, Language
      can :manage, LanguageLevel
      can :manage, LanguageVolunteer
      can :manage, Link
      can :manage, LinkType
      can :manage, Manager
      can :manage, Motivation
      can :manage, Nationality
      can :manage, NoticeType
      can :manage, Permission
      can :manage, Pro::Issue
      can :manage, Pro::Tracking
      can :manage, Profession
      can :manage, Profile
      can :manage, Project
      can :manage, Project
      can :manage, ProjectType
      can :manage, Proposal
      can :manage, Province
      can :manage, Pt::Centre
      can :manage, Pt::Entity
      can :manage, Pt::Other
      can :manage, Pt::Permanent
      can :manage, Pt::Punctual
      can :manage, Pt::Social
      can :manage, Pt::Subvention
      can :manage, Pt::Subvention
      can :manage, RecordHistory
      can :manage, Req::Reason
      can :manage, Req::RejectionType
      can :manage, Req::Status
      can :manage, Req::StatusTrace
      can :manage, RequestForm
      can :manage, RequestType
      can :manage, Resource
      can :manage, RoadType
      can :manage, Role
      can :manage, Rt::ActivityPublishing
      can :manage, Rt::ActivityUnpublishing
      can :manage, Rt::EntitySubscribe
      can :manage, Rt::EntityUnsubscribe
      can :manage, Rt::Other
      can :manage, Rt::ProjectPublishing
      can :manage, Rt::ProjectUnpublishing
      can :manage, Rt::VolunteerAmendment
      can :manage, Rt::VolunteerAppointment
      can :manage, Rt::VolunteersDemand
      can :manage, Rt::VolunteerSubscribe
      can :manage, Rt::VolunteerUnsubscribe
      can :manage, Sector
      can :manage, Skill
      can :manage, Status
      can :manage, Timetable
      can :manage, TrackingType
      can :manage, Trait
      can :manage, UnsubscribeLevel
      can :manage, UnsubscribeReason
      can :manage, Volun::Assessment
      can :manage, Volun::Availability
      can :manage, Volun::Contact
      can :manage, Volun::KnownLanguage
      can :manage, Volun::Tracking
      can :manage, Volunteer

      cannot :manage, Setting
      cannot :manage, User
    end

  end
end