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
ISSUE_NUM         = 10
VOLUNTEERS        = 10
ACTIVITIES_NUM    = 3
TIMETABLE_NUM     = 3
EVENTS_NUM        = 3
DOCUMENT_NUM      = 3
SKILLS_NUM        = 3
ACADEMIC_LEVELS   = 3
CONTACT_RESULTS   = 3
CONTACT_TYPES     = 3
DEGREES           = 3
DEGREE_TYPES      = 3
EMPLOYMENT_STATUS = 3
FRONTPAGE_ELEMS   = 3
FRONTPAGE_POSTN   = 3
INFO_SOURCES      = 3
LANGUAGES         = 3
LANGUAGE_LEVELS   = 3
LINKS             = 3
MANAGERS          = 3
MOTIVATIONS       = 3
PROFESSIONS       = 3
PROFILES          = 3
REJECTION_TYPES   = 3
SECTORS           = 3
STATUSES          = 3
TRACKING_TYPES    = 3
TRAITS            = 3
UNSUBS_LEVELS     = 3
UNSUBS_REASONS    = 3

REQUEST_REASONS = {
  0 => 'Difusión de proyectos',
  1 => 'Solicitud voluntarios',
  2 => 'Publicación actividad en agenda',
  3 => 'Otros'
}

REQUEST_STATUSES = {
  0 => 'Pendiente',
  1 => 'En trámite',
  2 => 'Aceptado',
  3 => 'Rechazado'
}

AREA_NAMES = [
  'Derechos Sociales',
  'Ambiental',
  'Cultural',
  'Deportivo',
  'Educativo',
  'Socio-sanitario',
  'Ocio y tiempo libre',
  'Comunitario y/o de ciudad',
  'Animales',
  'Participación',
  'On line',
  'Cuidados a las personas',
  'Sensibilización',
  'Comunicación',
  'Cooperación',
  'Responsabilidad social',
  'Emergencias',
  'Otros'
]

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

DISTRICTS = [
  'CENTRO',
  'ARGANZUELA',
  'RETIRO',
  'SALAMANCA',
  'CHAMARTIN',
  'TETUAN',
  'CHAMBERI',
  'FUENCARRAL-EL PARDO',
  'MONCLOA-ARAVACA',
  'LATINA',
  'CARABANCHEL',
  'USERA',
  'PUENTE VALLECAS',
  'MORATALAZ',
  'CIUDAD LINEAL',
  'HORTALEZA',
  'VILLAVERDE',
  'VILLA DE VALLECAS',
  'VICÁLAVARO',
  'SAN BLAS',
  'BARAJAS',
  'OTRO MUNICIPIO',
  'OTROS'
]

PROVINCES = [
  'ARABA-ALAVA',
  'ALBACETE',
  'ALICANTE-ALACANT',
  'ALMERIA',
  'AVILA',
  'BADAJOZ',
  'ILLES BALEARS',
  'BARCELONA',
  'BURGOS',
  'CACERES',
  'CADIZ',
  'CASTELLON-CASTELLO',
  'CIUDAD REAL',
  'CORDOBA',
  'A CORUÑA',
  'CUENCA',
  'GIRONA',
  'GRANADA',
  'GUADALAJARA',
  'GIPUZKOA',
  'HUELVA',
  'HUESCA',
  'JAEN',
  'LEON',
  'LLEIDA',
  'LA RIOJA',
  'LUGO',
  'MADRID',
  'MALAGA',
  'MURCIA',
  'NAVARRA',
  'OURENSE',
  'ASTURIAS',
  'PALENCIA',
  'LAS PALMAS',
  'PONTEVEDRA',
  'SALAMANCA',
  'SANTA CRUZ DE TENERIFE',
  'CANTABRIA',
  'SEGOVIA',
  'SEVILLA',
  'SORIA',
  'TARRAGONA',
  'TERUEL',
  'TOLEDO',
  'VALENCIA',
  'VALLADOLID',
  'BIZKAIA',
  'ZAMORA',
  'ZARAGOZA',
  'CEUTA',
  'MELILLA'
]

PROPOSALS = %w(subvencionado desistido desestimado excluido)

ENTITY_TYPES = {
  0 => 'Organización',
  1 => 'Empresa',
  2 => 'Asociación'
}

NOTICE_TYPES = {
  0 => 'email',
  1 => 'sms',
  2 => 'papel'
}

NATIONALITIES = {
	0 => 'Español',
	1 => 'Inglés',
	2 => 'Alemán',
	3 => 'Francés',
	4 => 'Italiano'
}

ROAD_TYPES = %w(ACCESO ARROYO AUTOPISTA AUTOVIA AVENIDA BULEVAR CALLE CALLEJON CAMINO
                CAMINOALTO CARRERA CARRETERA CAÑADA COLONIA COSTANILLA CUESTA GALERIA GLORIETA
                PARQUE PARTICULAR PASADIZO PASAJE PASEO PISTA PLAZA PLAZUELA PUENTE RONDA TRAVESIA)

puts "Creando Propiedades"
Setting.create(key: 'default_country', value: 'España')
Setting.create(key: 'default_province', value: 'Madrid')
Setting.create(key: 'road_types', value: ROAD_TYPES.join(','))


puts "Creando Medios de notificación"
NOTICE_TYPES.each do |kind , name|
  NoticeType.create!(kind: kind, description: name)
end

puts "Creando usuario administrador..."
User.create!(email: 'admin@madrid.es',
             password: 'Wordpass1',
             password_confirmation: 'Wordpass1',
             loggable: Manager.create!(name: 'admin'),
             notice_type: NoticeType.all.sample).save!

puts "Creando usuario gestor..."
user = User.create!(login: 'manager',
                    email: 'manager@madrid.es',
                    password: 'Wordpass1',
                    password_confirmation: 'Wordpass1',
                    loggable: Manager.create!(name: 'manager'),
                    notice_type: NoticeType.all.sample)

puts "Creando Colectivos"
AREA_NAMES.each do |name|
  Area.create!(name: name)
end

puts "Creando Ámbitos"
COLLECTIVE_NAMES.each do |name|
  Collective.create!(name: name)
end

puts "Creando Propuestas"
PROPOSALS.each do |name|
  Proposal.create!(name: name)
end

puts "Creando Tipos de solicitudes"
RequestType.kinds.each do |kind_name , kind_num|
  RequestType.create!(id: kind_num, kind: kind_num, description: kind_name)
end

puts "Creando Tipos de solicitudes"
ENTITY_TYPES.each do |kind , name|
  EntityType.create!(kind: kind, description: name)
end

puts "Creando Tipos de proyectos"
ProjectType.kinds.each do |kind_name , kind_num|
  ProjectType.create!(id: kind_num, kind: kind_num, description: kind_name)
end

puts "Creando Tipo documento"
(1..2).each do |n|
  IdNumberType.create!(name: "#{IdNumberType.model_name.human} #{n}")
end

puts "Creando Habilidades"
(1..SKILLS_NUM).each do |n|
  Skill.create!(name: "#{Skill.model_name.human} #{n}")
end

puts "Creando Coordinaciones"
(1..COORDINATIONS_NUM).each do |n|
  Coordination.create!(name: "#{Coordination.model_name.human} #{n}")
end

puts "Creando Direcciones"
(1..ADDRESSES_NUM).each do |n|
  address = Address.new(
              postal_code:           Faker::Address.postcode,
              road_type:             ROAD_TYPES.sample,
              road_name:             Faker::Address.street_name,
              road_number_type:      ['num', 'km'].sample,
              road_number:           rand(100).to_s,
              grader:                [*'A'..'Z'].sample,
              stairs:                rand(300).to_s,
              floor:                 rand(9).to_s,
              door:                  rand(10).to_s,
              borough:               nil,
              province:              PROVINCES.sample,
              country:               "España",
              town:                  "Madrid",
              district:              DISTRICTS.sample
            )
  address.no_bdc_check = true
  address.save!
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
    address:                  Address.all.sample
  )
end

puts "Creando Motivos de solicitud"
REQUEST_REASONS.each do |kind , name|
  Req::Reason.create!(kind: kind)
end

puts "Creando estados de solicitud"
Req::Status.kinds.each do |kind_name, kind_num|
  Req::Status.create!(kind: kind_num, description: kind_name)
end

puts "Creando Solicitudes"
RequestType.all.each do |request_type|
  (1..REQUEST_FORMS_NUM).each do |n|
    request_form = RequestForm.new(
      request_type: request_type,
      status: Req::Status.pending.take,
      status_date: DateTime.now,
      comments: "#{n} #{Faker::Lorem.sentence}",
      user: user
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
      address = Address.all.sample
      address.no_bdc_check = true
      event = Event.create!(
        address:    address,
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

puts "Creando Niveles Académicos"
(1..ACADEMIC_LEVELS).each do |n|
  AcademicLevel.create!(name: "AcademicLevel_#{n}", educational_type: "EdType_#{n}")
end

puts "Creando Contact Results"
(1..CONTACT_RESULTS).each do |n|
  ContactResult.create!(name: "ContactResult_#{n}")
end

puts "Creando Contact Types"
(1..CONTACT_TYPES).each do |n|
  ContactType.create!(name: "ContactTypes_#{n}")
end

puts "Creando Tipos de titulaciones"
(1..DEGREE_TYPES).each do |n|
  DegreeType.create!(name: "DegreeTypes_#{n}", educational_type: "EdType_#{n}")
end

puts "Creando Titulaciones"
(1..DEGREES).each do |n|
  Degree.create!(name: "Degrees_#{n}", degree_type_id: n)
end

puts "Creando Employment Statuses"
(1..EMPLOYMENT_STATUS).each do |n|
  EmploymentStatus.create!(name: "EmploymentStatus_#{n}")
end

puts "Creando Event Types"
EventType.kinds.each do |kind_name, kind_num|
  EventType.create!(id: kind_num, kind: kind_num, description: kind_name)
end

puts "Creando Frontpage Positions"
(1..FRONTPAGE_POSTN).each do |n|
  FrontpagePosition.create!(position: n, description: "Frontpage position #{n} description.")
end

puts "Creando Frontpage Elements"
(1..FRONTPAGE_ELEMS).each do |n|
  FrontpageElement.create!(frontpage_position_id: n, text_panel: "Frontpage element #{n} text panel.", created_by: User.last.id)
end

puts "Creando Info Sources"
(1..INFO_SOURCES).each do |n|
  InfoSource.create!(name: "InfoSource_#{n}")
end

puts "Creando Language Levels"
(1..LANGUAGE_LEVELS).each do |n|
  LanguageLevel.create!(name: "LanguageLevel_#{n}")
end

puts "Creando Languages"
(1..LANGUAGES).each do |n|
  Language.create!(name: "Language_#{n}")
end

puts "Creando Links"
(1..LINKS).each do |n|
  Link.create!(url: "http://url#{n}.com", description: "Link #{n} description.")
end

puts "Creando Managers"
(1..MANAGERS).each do |n|
  Manager.create!(name: "Manager_#{n}")
end

puts "Creando Motivations"
(1..MOTIVATIONS).each do |n|
  Motivation.create!(name: "Motivation_#{n}", active: true)
end

puts "Creando Nacionalidades"
NATIONALITIES.each do |id, name|
  Nationality.create!(name: name)
end

puts "Creando Professions"
(1..PROFESSIONS).each do |n|
  Profession.create!(name: "Profession_#{n}")
end

puts "Creando Profiles"
(1..PROFILES).each do |n|
  Profile.create!(name: "Profile_#{n}")
end

puts "Creando Motivos de rechazo"
(1..REJECTION_TYPES).each do |n|
  Req::RejectionType.create!(name: "Rejection Type #{n}", description: "Rejection type #{n} description.")
end

puts "Creando Sectors"
(1..SECTORS).each do |n|
  Sector.create!(name: "Sector_#{n}", active: true)
end

puts "Creando Statuses"
(1..STATUSES).each do |n|
  Status.create!(name: "Status_#{n}")
end

puts "Creando Tipos de Seguimiento"
(1..TRACKING_TYPES).each do |n|
  TrackingType.create!(name: "TrackingType_#{n}")
end

puts "Creando Cualidades"
(1..TRAITS).each do |n|
  Trait.create!(name: "Trait_#{n}")
end

puts "Creando Niveles de Baja"
(1..UNSUBS_LEVELS).each do |n|
  UnsubscribeLevel.create!(kind: n, description: "Trait #{n} description.")
end

puts "Creando Motivos de Baja"
(1..UNSUBS_REASONS).each do |n|
  UnsubscribeReason.create!(name: "UnsubscribeReason_#{n}")
end

puts "Creando Voluntarios"
(1..VOLUNTEERS).each do |n|
  Volunteer.create!(name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    id_number_type_id: IdNumberType.last.id,
                    id_number: "%09d" % n,
                    email: Faker::Internet.email,
                    address_id: Address.last.id)
end