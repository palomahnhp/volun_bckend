require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM      = 10
DISTRICTS_NUM     = 10
ACTIVITIES_NUM    = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
ADDRESSES_NUM     = 20
PROPOSAL          = 10
ENTITY            = 10
RACKING           = 10
ISSUE             = 10
TIMETABLE         = 10
DOCUMENT          = 10
PROJECT_TYPES = {
  0 => 'Servicios Sociales',
  1 => 'Centros de mayores',
  2 => 'Permanentes',
  3 => 'Puntuales',
  4 => 'Entidades',
  5 => 'Subvencionados',
  6 => 'Otros'
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

PROPOSALS = [
    'subvencionado',
    'desistido',
    'desestimado',
    'excluido'
]

puts "Creando usuario administrador..."
User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1').save!

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

puts "Creando Tipos de proyectos"
PROJECT_TYPES.each do |kind , name|
  ProjectType.create!(kind: kind)
end

puts "Creando entidades"
(1..ENTITIES_NUM).each do |n|
  Entity.create!(name: "#{Entity.model_name.human} #{n}")
end

puts "Creando coordinaciones"
(1..COORDINATIONS_NUM).each do |n|
  Coordination.create!(name: "#{Coordination.model_name.human} #{n}")
end

puts "Creando Distritos"
DISTRICTS.each do |name|
  District.create!(name: name)
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
PROJECT_TYPE_MODELS = [
  ProjectTypeSubvention,
  ProjectTypeEntity,
  ProjectTypePunctual,
  ProjectTypePermanent,
  ProjectTypeCentre,
  ProjectTypeSocial,
  ProjectTypeOther
]
PROJECT_TYPE_MODELS.each do |pt_model|
  (1..PROJECTS_NUM).each do |n|
    pt_record = pt_model.new
    project   = pt_record.project
    project.attributes = {
      name:                  "#{Faker::App.name} #{pt_model.model_name.human} #{n}",
      description:           Faker::Lorem.sentence,
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
      contact_name:          Faker::Name.name,
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
    }

    [Address, Area, Collective, Coordination, District].each do |model|
      model.first(5).each do |record|
        unless project.public_send("#{model.model_name.singular}_ids").include? record.id
          project.public_send(model.model_name.plural) << record
        end
      end
    end

    pt_record.save!
  end
end