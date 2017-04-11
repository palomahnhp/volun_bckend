require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

ADDRESSES_NUM     = 20
PROJECTS_NUM      = 10
REQUEST_FORMS_NUM = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
PROPOSAL_NUM      = 10
ENTITY_NUM        = 10
RACKING_NUM       = 10
VOLUNTEERS        = 10
FRONTPAGE_ELEMS   = 3
FRONTPAGE_POSTN   = 3
LINKS             = 3
PROFESSIONS       = 3
REJECTION_TYPES   = 3
SKILLS_NUM        = 3
ACTIVITIES_NUM    = 3
TIMETABLE_NUM     = 3
EVENTS_NUM        = 3
DOCUMENT_NUM      = 3


REQUEST_REASONS = [
  'Difusión de proyectos',
  'Solicitud voluntarios',
  'Publicación actividad en agenda',
  'Otros'
]

REQUEST_STATUSES = {
  0 => 'Pendiente',
  1 => 'En trámite',
  2 => 'Aceptado',
  3 => 'Rechazado'
}

COLLECTIVE_NAMES = [
  'Menores',
  'Jóvenes',
  'Mayores',
  'Diversidad funcional',
  'Mujer',
  'Inmigrantes',
  'Refugiados',
  'Personas sin hogar',
  'Reclusos y exreclusos',
  'Personas enfermas',
  'Exclusión social',
  'Voluntariado',
  'Toda la población',
  'Otros'
]

PROPOSALS = %w(subvencionado desistido desestimado excluido)

NATIONALITIES = [
	'Español',
	'Inglés',
	'Alemán',
	'Francés',
	'Italiano'
]

puts "Creando Colectivos"
COLLECTIVE_NAMES.each do |name|
  Collective.create!(name: name)
end

puts "Creando Habilidades"
(1..SKILLS_NUM).each do |n|
  Skill.create!(name: "#{Skill.model_name.human} #{n}")
end

puts "Creando Coordinaciones"
(1..COORDINATIONS_NUM).each do |n|
  Coordination.create!(name: "#{Coordination.model_name.human} #{n}")
end

puts "Creando Professions"
(1..PROFESSIONS).each do |n|
  Profession.create!(name: "Profession_#{n}")
end

puts "Creando Motivos de rechazo"
(1..REJECTION_TYPES).each do |n|
  Req::RejectionType.create!(name: "Rejection Type #{n}", description: "Rejection type #{n} description.")
end

Rake::Task['db:custom_seed'].invoke

puts "Creando Direcciones"
(1..ADDRESSES_NUM).each do |n|
  Address.create!(
    postal_code:           Faker::Address.postcode,
    road_type:             RoadType.all.sample,
    road_name:             Faker::Address.street_name,
    road_number_type:      ['num', 'km'].sample,
    road_number:           rand(100).to_s,
    grader:                [*'A'..'Z'].sample,
    stairs:                rand(300).to_s,
    floor:                 rand(9).to_s,
    door:                  rand(10).to_s,
    borough:               nil,
    province:              Province.all.sample,
    country:               'España',
    town:                  'Madrid',
    district:              District.all.sample,
    normalize:             false
  )
end

puts "Creando Entidades"
(1..ENTITIES_NUM).each do |n|
  Entity.create!(
    name:                     "#{Entity.model_name.human} #{n}",
    email:                    Faker::Internet.email,
    representative_name:      Faker::Name.name,
    representative_last_name: Faker::Name.last_name,
    contact_name:             Faker::Name.name,
    contact_last_name:        Faker::Name.last_name,
    entity_type:              EntityType.all.sample,
    address:                  Address.all.sample,
    vat_number:               %w(Z8383769K 38741046F).sample
  )
end

puts "Creando Motivos de solicitud"
REQUEST_REASONS.each do |name|
  Req::Reason.create!(name: name, description: name)
end

puts "Creando Solicitudes"
RequestType.all.each do |request_type|
  (1..REQUEST_FORMS_NUM).each do |n|
    request_form = RequestForm.new(
      request_type: request_type,
      status: Req::Status.pending.take,
      status_date: DateTime.now,
      # user: user
      # rejection_type_id: integer,
    )

    rt_attributes = case request_type.kind
                      when 'rt_volunteer_subscribe'
                        {
                          name: Faker::Name.name,
                          last_name: Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number,
                          email: Faker::Internet.email
                        }
                      else {}
                    end
    request_form.build_rt_extendable(rt_attributes)

    request_form.save!
  end
end

puts "Creando Proyectos"
ProjectType.all.each do |project_type|
  (1..PROJECTS_NUM).each do |n|
    project = Project.new(
      name:                  "#{Faker::App.name} #{project_type} #{n}",
      description:           Faker::Lorem.sentence,
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow, DateTime.tomorrow + 10),
      contact_name:          Faker::Name.name,
      contact_last_name:     Faker::Name.last_name,
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
      project_type:          project_type,
      entity:                Entity.all.sample
    )

    pt_attributes = case project_type.kind
                    when 'pt_subvention' then { representative_name: Faker::Name.name }
                    when 'pt_entity'     then { request_description: Faker::Lorem.sentence }
                    else {}  
                    end
    project.build_pt_extendable(pt_attributes)

    project.save!

    [Area, Collective, Coordination].each do |model|
      model.first(5).each do |record|
        unless project.public_send("#{model.model_name.singular}_ids").include? record.id
          project.public_send(model.model_name.plural) << record
        end
      end
    end


    puts "Creando Eventos"
    EVENTS_NUM.times do
      event = Event.create!(
        address:    Address.all.sample,
        eventable:  project,
        timetables_attributes: [{
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        }]
      )

      puts "Creando Horarios para evento #{event.id}"
      TIMETABLE_NUM.times do
        Timetable.create!(
          event: event,
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        )
      end
    end
  end
end

puts "Creando Actividades"
(1..ACTIVITIES_NUM).each do |n|
  activity = Activity.create!(
    name:        "Actividad #{n}",
    description: Faker::Lorem.sentence,
    start_date:  rand(100).days.ago.to_date,
    end_date:    rand(100).days.since.to_date,
    transport:   "Medio de transporte #{n}",
    pdf_url:     nil,
    entity_id:   Entity.all.sample,
    area_id:     Area.all.sample,
    project_id:  nil,
    share:       [true, false].sample,
  )

  puts "Creando eventos de actividad #{activity.id}"
  EVENTS_NUM.times do
    event = Event.create!(
      address:    Address.all.sample,
      eventable:  activity,
      timetables_attributes: [{
        execution_date:  rand(100).days.since.to_date,
        start_hour: '11:11',
        end_hour:   '12:12'
      }]
    )

    puts "Creando Horarios para evento #{event.id}"
    TIMETABLE_NUM.times do
      Timetable.create!(
        event: event,
        execution_date:  rand(100).days.since.to_date,
        start_hour: '11:11',
        end_hour:   '12:12'
      )
    end
  end
end

puts "Creando Voluntarios"
(1..VOLUNTEERS).each do |n|
  Volunteer.create!(name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    id_number_type_id: IdNumberType.last.id,
                    id_number: %w(Z8383769K 38741046F).sample,
                    email: Faker::Internet.email,
                    address:  Address.all.sample)
end

puts "#{I18n.t('creating')} manager user"
attributes = {
  login:                 'manager',
  email:                 'manager@madrid.es',
  password:              'Wordpass1',
  password_confirmation: 'Wordpass1',
  loggable:              Manager.first,
}
user = User.find_or_initialize_by(login: attributes[:login])

if user.new_record?
  user.attributes = attributes
  user.save!
else
  user.update_attributes!(attributes)
end

puts "#{I18n.t('creating')} entity user"
attributes = {
  login: 'entity',
  email: 'entity@madrid.es',
  password: 'Wordpass1',
  password_confirmation: 'Wordpass1',
  loggable: Entity.first,
  notice_type: NoticeType.all.sample
}
user = User.find_or_initialize_by(login: attributes[:login])

if user.new_record?
  user.attributes = attributes
  user.save!
else
  user.update_attributes!(attributes)
end

puts "#{I18n.t('creating')} voluntary user"
attributes = {
  email:                 'volunteering@madrid.es',
  login:                 'volunteering',
  password:              'Wordpass1',
  password_confirmation: 'Wordpass1',
  loggable:              Volunteer.first,
  notice_type:           NoticeType.all.sample
}
user = User.find_or_initialize_by(login: attributes[:login])

if user.new_record?
  user.attributes = attributes
  user.save!
else
  user.update_attributes!(attributes)
end




puts "Creando Frontpage Positions"
(1..FRONTPAGE_POSTN).each do |n|
  FrontpagePosition.create!(position: n, description: "Frontpage position #{n} description.")
end

puts "Creando Frontpage Elements"
(1..FRONTPAGE_ELEMS).each do |n|
  FrontpageElement.create!(frontpage_position_id: n, text_panel: "Frontpage element #{n} text panel.", created_by: User.last.id)
end