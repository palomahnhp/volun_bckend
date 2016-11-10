require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM   = 100
DISTRICTS_NUM  = 10
ACTIVITIES_NUM = 10
ENTITIES_NUM   = 10
SECTORS_NUM    = 10
ADDRESSES_NUM  = 20
PROPOSAL       = 10
ENTITY         = 10
RACKING        = 10
ISSUE          = 10
TIMETABLE      = 10
DOCUMENT       = 10
PROJECT_TYPE_NAMES = [
  'Servicios Sociales',
  'Centros de mayores',
  'Permanentes',
  'Puntuales',
  'Entidades',
  'Subvencionados',
  'Otros'
]

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
  'Centro',
  'Arganzuela',
  'Retiro',
  'Salamanca',
  'Chamartín',
  'Tetuán',
  'Chamberí',
  'Fuencarral',
  'Moncloa',
  'Latina',
  'Carabanchel',
  'Usera',
  'Puente de Vallecas',
  'Moratalaz',
  'Ciudad Lineal',
  'Hortaleza',
  'Villaverde',
  'Villa de Vallecas',
  'Vicálvaro',
  'San Blas Canillejas',
  'Barajas',
]

puts "Creando Colectivos"
AREA_NAMES.each do |name|
  Area.create!(name: name)
end

puts "Creando Ámbitos"
COLLECTIVE_NAMES.each do |name|
  Collective.create!(name: name)
end

puts "Creando Tipos de proyectos"
PROJECT_TYPE_NAMES.each do |name|
  ProjectType.create!(name: name)
end

puts "Creando entidades"
(1..ENTITIES_NUM).each do |n|
  Entity.create!(name: "#{Entity.model_name.human} #{n}")
end

puts "Creando Distritos"
DISTRICTS.each do |name|
  District.create!(name: name)
end

puts "Creando Propuestas"
(1..PROPOSAL).each do |n|
  Proposal.create!(name: "#{Proposal.model_name.human} #{n}")
end

puts "Creando direcciones"
(1..ADDRESSES_NUM).each do |n|
  Address.create!(
      postal_code:           Faker::Address.postcode,
      road_type:             ['Calle', 'Plaza', 'Av.'].sample,
      road_name:             Faker::Address.street_name,
      number_type:           nil,
      grader:                nil,
      stairs_number:         rand(300).to_s,
      floor_number:          rand(9).to_s,
      door_number:           rand(10).to_s
  )
end

puts "Creando Proyectos"
(1..PROJECTS_NUM).each do |n|
  p = Project.create!(
    name:                  "#{Faker::App.name} #{n}",
    description:           Faker::Lorem.sentence,
    functions:             Faker::Lorem.sentence,
    comments:              Faker::Lorem.sentence,
    project_type_id:       ProjectType.all.sample.id,
    entity_id:             Entity.all.sample.id,
    execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
    execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
    contact_person:        Faker::Name.name,
    phone_number:          Faker::PhoneNumber.phone_number,
    email:                 Faker::Internet.email,
    beneficiaries_num:     10,
    volunteers_num:        rand(100),
  )

  [Address, Area, Collective, Coordination, District].each do |model|
    model.first(5).each do |record|
      unless p.public_send("#{model.model_name.singular}_ids").include? record.id
        p.public_send(model.model_name.plural) << record
      end
    end
  end
end

puts "Creando usuario administrador..."
User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1').save!