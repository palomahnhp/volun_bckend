FactoryGirl.define do
  factory :link_type do
    kind 1
    description "MyText"

    trait :invalid do
    end
  end
  factory :setting do
    key "MyString"
    value "MyString"

    trait :invalid do
    end
  end
  factory :notice_type do
    kind "email"
    description "MyText"
    active true
  end
  factory :manager do
    name "MyString"
    phone_number "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :user do
    login  'My login'
    locale 'en'
    email  'user@email.com'
    password 'Wordpass1'
    password_confirmation 'Wordpass1'
    association :notice_type
    # TODO check if there is a way to use loggable
    loggable_id 1
    loggable_type 'Manager'
  end
  factory :known_language, class: 'Volun::KnownLanguage' do
    association :volunteer
    association :language 
    association :language_level 

    trait :invalid do
      association :volunteer
    end
  end
  factory :rt_other, class: 'Rt::Other' do
    description "MyText"

    trait :invalid do
    end
  end
  factory :activity_unpublishing, class: 'Rt::ActivityUnpublishing' do
    reason "MyText"

    trait :invalid do
    end
  end
  factory :activity_publishing, class: 'Rt::ActivityPublishing' do
    name "MyString"
    organizer "MyString"
    description "MyText"
    execution_date "2017-01-27"
    execution_hour "MyString"
    association :road_type 
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "MyString"
    borough "MyString"
    association :district 
    town "MyString"
    association :province 
    association :project 

    trait :invalid do
    end
  end
  factory :project_unsubscribe, class: 'Rt::ProjectUnsubscribe' do
    association :project 
    reason "MyText"

    trait :invalid do
    end
  end
  factory :project_unpublishing, class: 'Rt::ProjectUnpublishing' do
    reason "MyText"

    trait :invalid do
    end
  end
  factory :project_publishing, class: 'Rt::ProjectPublishing' do
    description "MyText"
    association :road_type 
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "MyString"
    borough "MyString"
    association :district 
    town "MyString"
    association :province 

    trait :invalid do
    end
  end
  factory :volunteers_demand, class: 'Rt::VolunteersDemand' do
    description "MyText"
    execution_start_date "2017-01-27"
    execution_end_date "2017-01-28"
    association :road_type 
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "28045"
    borough "MyString"
    association :district 
    town "MyString"
    association :province 
    requested_volunteers_num "MyString"
    volunteers_profile "MyText"
    volunteer_functions_1 "MyText"
    volunteer_functions_2 "MyText"
    volunteer_functions_3 "MyText"

    trait :invalid do
    end
  end
  factory :entity_unsubscribe, class: 'Rt::EntityUnsubscribe' do
    reason "MyText"

    trait :invalid do
    end
  end
  factory :entity_subscribe, class: 'Rt::EntitySubscribe' do
    name "MyString"
    description "MyText"
    vat_number "MyString"
    email "MyString"
    representative_name "MyString"
    representative_last_name "MyString"
    representative_last_name_alt "MyString"
    contact_name "MyString"
    contact_last_name "MyString"
    contact_last_name_alt "MyString"
    phone_number "MyString"
    phone_number_alt "MyString"
    publish_pictures false
    annual_survey false
    association :entity_type
    comments "MyText"
    other_subscribe_reason "MyText"
    association :road_type
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "MyString"
    borough "MyString"
    association :district
    town "MyString"
    association :province

    trait :invalid do
    end
  end
  factory :volunteer_appointment, class: 'Rt::VolunteerAppointment' do
    reason "MyText"

    trait :invalid do
    end
  end
  factory :volunteer_amendment, class: 'Rt::VolunteerAmendment' do
    association :road_type
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "MyString"
    borough "MyString"
    association :district
    town "MyString"
    association :province
    phone_number "MyString"
    phone_number_alt "MyString"
    email "MyString"

    trait :invalid do
    end
  end
  factory :volunteer_unsubscribe, class: 'Rt::VolunteerUnsubscribe' do
    level 1
    reason "MyText"

    trait :invalid do
    end
  end
  factory :volunteer_subscribe, class: 'Rt::VolunteerSubscribe' do
    name "MyString"
    last_name "MyString"
    last_name_alt "MyString"
    association :id_number_type
    id_number "MyString"
    gender 1
    birth_date "2017-01-27"
    association :nationality
    phone_number "MyString"
    phone_number_alt "MyString"
    email "MyString"
    association :road_type
    road_name "MyString"
    number_type "MyString"
    road_number "MyString"
    postal_code "MyString"
    borough "MyString"
    association :district
    town "MyString"
    association :province
    association :status
    association :employment_status
    vocne false
    available false
    availability_date "2017-01-27"
    association :academic_level
    comments "MyText"
    expectations "MyText"
    agreement false
    agreement_date "2017-01-27 10:42:04"
    search_authorization false
    representative_statement false
    has_driving_license false
    publish_pictures false
    annual_survey false
    association :info_source
    other_academic_info "MyText"
    association :profession

    trait :invalid do
      name
    end
  end
  factory :request_form do
    association :request_type
    rt_extendable_id 1
    rt_extendable_type 'Rt::VolunteerSubscribe'
    association :user
    status 1
    status_date "2017-01-27 10:42:03"
    association :rejection_type
    association :request_reason
    comments "MyText"

    trait :invalid do
      association :request_type
    end
  end
  factory :request_type do
    kind 1
    description "MyText"
    active true

    trait :invalid do
      association :kind
    end
  end
  factory :rejection_type, class: 'Req::RejectionType' do
    name "MyRejectionType"
    description "MyText"
    active true

    trait :invalid do
      name nil 
    end
  end
  factory :assessment, class: 'Volun::Assessment' do
    association :volunteer
    association :trait
    association :project
    trait_other "MyString"
    assessment false
    comments "MyText"

    trait :invalid do
      association :volunteer
    end
  end
  factory :contact, class: 'Volun::Contact' do
    association :volunteer
    association :contact_result
    association :project
    association :manager
    association :contact_type
    contact_date "2017-01-27 10:41:55"
    comments "MyText"

    trait :invalid do
      association :volunteer
    end
  end
  factory :volun_tracking, class: 'Volun::Tracking' do
    association :volunteer
    association :tracking_type
    association :project
    association :manager
    tracking_date "2017-01-27 10:41:53"
    comments "MyText"

    trait :invalid do
      association :volunteer
    end
  end
  factory :availability, class: 'Volun::Availability' do
    association :volunteer
    day "MyString"
    start_hour "MyString"
    end_hour "MyString"

    trait :invalid do
      association :volunteer
    end
  end
  factory :volunteer do
    name "MyString"
    last_name "MyString"
    last_name_alt "MyString"
    association :id_number_type
    id_number "123456789"
    gender "female" #Volunteer.genders[:female]
    birth_date "2017-01-27"
    association :nationality
    phone_number "632147896"
    phone_number_alt "932147896"
    email "volun@email.com"
    association :address
    association :status
    association :employment_status
    vocne false
    available false
    availability_date "2022-12-27"
    association :academic_level
    subscribe_date "2017-01-27"
    unsubscribe_date "2017-01-27"
    association :unsubscribe_reason
    comments "MyText"
    expectations "MyText"
    agreement false
    agreement_date "2017-01-27 10:41:50"
    search_authorization false
    representative_statement false
    has_driving_license false
    publish_pictures false
    annual_survey false
    subscribed_at "2017-01-27 10:41:50"
    association :manager
    association :info_source
    other_academic_info "MyText"
    association :profession
    review 0
    active true

    trait :invalid do
      name nil
    end
  end
  factory :sector do
    name "MyString"
    active "MyString"

    trait :invalid do
      name nil
    end
  end
  factory :motivation do
    name "MyString"
    active "MyString"

    trait :invalid do
      name nil
    end
  end
  factory :degree_type do
    name "MyString"
    educational_type "MyString"

    trait :invalid do
      name nil
    end
  end
  factory :contact_type do
    name "MyString"
    active "MyString"

    trait :invalid do
      name nil
    end
  end
  factory :borough do
    name "MyString"
    active "MyString"
    association :district

    trait :invalid do
      name nil
    end
  end
  factory :trait do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :contact_result do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :language_level do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :language do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :profession do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :skill do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :info_source do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :profile do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :unsubscribe_reason do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :academic_level do
    name "MyString"
    educational_type "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :degree do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :employment_status do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :status do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :nationality do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :id_number_type do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :pt_entity, class: 'Pt::Entity' do
    request_date "2017-01-27"
    request_description "MyText"
    volunteers_profile "MyString"
    activities "MyText"
    sav_date "2017-01-27"
    derived_volunteers_num 1
    added_volunteers_num 1
    agreement_signed false
    agreement_date "2017-01-27"
    prevailing false

    trait :invalid do
      request_date 'xxxxxxxxx'
    end
  end
  factory :pt_subvention, class: 'Pt::Subvention' do
    representative_name "MyString"
    representative_last_name "MyString"
    representative_last_name_alt "MyString"
    id_num "MyString"
    vat_number "MyString"
    entity_registry false
    cost 1.5
    requested_amount 1.5
    subsidized_amount 1.5
    initial_volunteers_num 1
    participants_num 1
    has_quality_evaluation false
    association :proposal

    trait :invalid do
      association :representative_name
    end
  end
  factory :proposal do
    name "MyString"
    description "MyText"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :link do
    url "MyString"
    description "MyText"
    kind 1
    linkable_id 1
    linkable_type 'Project'

    trait :invalid do
      association :url
    end
  end
  factory :activity do
    name "MyString"
    description "MyText"
    start_date "2017-01-27 10:41:05"
    end_date "2017-01-27 10:41:05"
    transport "MyText"
    pdf_url "MyString"
    association :entity
    association :area
    association :project
    share false

    trait :invalid do
      name nil
    end
  end
  factory :timetable do
    association :event
    execution_date "2017-01-27"
    start_hour "MyString"
    end_hour "MyString"

    trait :invalid do
      association :event
    end
  end
  factory :event do
    publish false
    eventable_id 1
    eventable_type 'Activity'
    association :event_type
    association :address

    trait :invalid do
      association :address
    end
  end
  factory :event_type do
    kind 1
    description "MyText"

    trait :invalid do
      association :kind
    end
  end
  factory :document do
    name "MyString"
    description "MyText"
    documentum_id "MyString"
    association :project

    trait :invalid do
      name nil
    end
  end
  factory :pro_issue, class: 'Pro::Issue' do
    comments "MyText"
    start_date "2017-01-27 10:40:57"
    association :project

    trait :invalid do
      association :project
    end
  end
  factory :pro_tracking, class: 'Pro::Tracking' do
    comments "MyText"
    start_date "2017-01-27 10:40:55"
    association :project

    trait :invalid do
      association :project
    end
  end
  factory :project do
    name "MyString"
    active true
    description "MyText"
    functions "MyString"
    execution_start_date "2017-01-27"
    execution_end_date "2017-01-27"
    contact_name "MyString"
    contact_last_name "MyString"
    contact_last_name_alt "MyString"
    phone_number "MyString"
    phone_number_alt "MyString"
    email "MyString@a.com"
    comments "MyText"
    beneficiaries_num 1
    volunteers_num 1
    insured false
    volunteers_allowed false
    publish false
    outstanding false
    insurance_date "2017-01-27"
    association :project_type
    pt_extendable_id ProjectType.kinds[:pt_social]
    pt_extendable_type 'Pt::Social'
    association :entity

    trait :invalid do
      name nil
    end
  end
  factory :project_type do
    id ProjectType.kinds[:pt_social]
    kind "pt_social"
    description "MyText"

    trait :invalid do
      kind nil
      description nil
    end
  end
  factory :ent_tracking, class: 'Ent::Tracking' do
    association :tracking_type
    association :entity
    association :manager
    tracked_at "2017-01-27 10:40:50"
    comments "MyText"

    trait :invalid do
      association :tracked_at
    end
  end
  factory :entity do
    name "MyString"
    description "MyText"
    vat_number "MyString"
    email "MyString@a.com"
    representative_name "MyString"
    representative_last_name "MyString"
    representative_last_name_alt "MyString"
    contact_name "MyString"
    contact_last_name "MyString"
    contact_last_name_alt "MyString"
    phone_number "MyString"
    phone_number_alt "MyString"
    publish_pictures false
    annual_survey false
    association :req_reason
    association :entity_type
    comments "MyText"
    other_subscribe_reason "MyText"
    association :address
    active true
    subscribed_at "2017-01-27 10:40:48"
    unsubscribed_at "2017-01-27 10:40:48"

    trait :invalid do
      name nil
    end
  end
  factory :entity_type do
    kind 1
    description "MyText"
    active true

    trait :invalid do
      association :kind
    end
  end
  factory :req_reason, class: 'Req::Reason' do
    kind 1
    description "MyText"
    active true

    trait :invalid do
      association :kind
    end
  end
  factory :tracking_type do
    name "MyString"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :address do
    road_type "MyString"
    road_name "MyString"
    road_number_type "MyString"
    road_number "MyString"
    grader "MyString"
    stairs "MyString"
    floor "MyString"
    door "MyString"
    postal_code "28047"
    borough "MyString"
    district "MyString"
    town "MyString"
    province "MyString"
    country "MyString"
    ndp_code "MyString"
    local_code "MyString"
    class_name "MyString"
    latitude "MyString"
    longitude "MyString"

    trait :invalid do
      association :road_type
    end
  end
  factory :record_history do
    association :user
    recordable_id 1
    recordable_type 'Volunteer'
    recordable_changed_at "2017-01-27 10:40:33"

    trait :invalid do
    end
  end
  factory :coordination do
    name "MyString"
    description "MyText"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :collective do
    name "MyString"
    description "MyText"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :area do
    name "MyString"
    description "MyText"
    active true

    trait :invalid do
      name nil
    end
  end
  factory :frontpage_position do
    position 1
    description "MyText"
    active true

    trait :invalid do
      position nil
    end
  end
  factory :frontpage_element do
    association :frontpage_position
    active true

    trait :invalid do
      frontpage_position_id nil
    end
  end
end
