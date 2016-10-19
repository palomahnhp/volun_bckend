require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM      = 100
DISTRICTS_NUM     = 10
ACTIVITIES_NUM    = 10
SCOPES_NUM        = 10
ORGANIZATIONS_NUM = 10
SECTORS_NUM       = 10
NEIGHBORHOOD      = 10
PROPOSAL          = 10
ORGANIZATION      = 10

PROJECT_TYPE_NAMES = ['Servicios Sociales', 'Centros de mayores', 'Permanentes', 'Puntuales', 'Entidades', 'Subvencionados']

DISTRICTS = {
  '01' => 'Centro',
  '02' => 'Arganzuela',
  '03' => 'Retiro',
  '04' => 'Salamanca',
  '05' => 'Chamartín',
  '06' => 'Tetuán',
  '07' => 'Chamberí',
  '08' => 'Fuencarral',
  '09' => 'Moncloa',
  '10' => 'Latina',
  '11' => 'Carabanchel',
  '12' => 'Usera',
  '13' => 'Puente de Vallecas',
  '14' => 'Moratalaz',
  '15' => 'Ciudad Lineal',
  '16' => 'Hortaleza',
  '17' => 'Villaverde',
  '18' => 'Villa de Vallecas',
  '19' => 'Vicálvaro',
  '20' => 'San Blas Canillejas',
  '21' => 'Barajas',
}

puts "Creando Tipos de proyectos"
  PROJECT_TYPE_NAMES.each do |pt_name|
    ProjectType.create!(name: pt_name)
end

puts "Creando Ámbitos de actuación"
(1..SCOPES_NUM).each do |n|
  Scope.create!(name: Faker::Company.profession)
end

puts "Creando entidades"
(1..ORGANIZATIONS_NUM).each do |n|
  Organization.create!(name: "#{Organization.model_name.human} #{n}")
end

puts "Creando Sectores de intervención"
(1..SECTORS_NUM).each do |n|
  Sector.create!(name: "#{Sector.model_name.human} #{n}")
end

puts "Creando Distritos"
DISTRICTS.each do |_code, name|
  District.create!(name: name)
end

puts "Creando Propuestas"
(1..PROPOSAL).each do |n|
  Proposal.create!(name: "#{Proposal.model_name.human} #{n}")
end

puts "Creando Entidades"
(1..ORGANIZATION).each do |n|
  Organization.create!(name: "#{Organization.model_name.human} #{n}")
end

puts "Creando Barrios"
(1..NEIGHBORHOOD).each do |n|
  Neighborhood.create!(name: "#{Neighborhood.model_name.human} #{n}")
end

puts "Creando Proyectos"
(1..PROJECTS_NUM).each do |n|
  Project.create!(
    # code: Faker::Code.isbn,
    # description: Faker::Lorem.sentence,
    # status:,
    # work_place:,
    name:                  Faker::App.name,
    district_id:           District.all.sample.id,
    proposal_id:           Proposal.all.sample.id,
    project_type_id:       ProjectType.all.sample.id,
    neighborhood_id:       Neighborhood.all.sample.id,
    organization_id:       Organization.all.sample.id,
    registry_date:         Faker::Time.between(DateTime.now - 10, DateTime.now),
    start_date:            Faker::Time.between(DateTime.now - 10, DateTime.now),
    end_date:              Faker::Time.between(DateTime.now - 10, DateTime.now),
    city_hall:             false,
    important:             false,
    subsidized:            false,
    cooperation_agreement: false,
    assessment:            Faker::Lorem.paragraph,
    manager:               Faker::Name.name,
    manager_telf:          Faker::PhoneNumber.phone_number,
    voluntaries_num:       rand(100),
    profile:               "Perfil de voluntario #{n}",
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

puts "Creando usuario administrador..."

User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1').save!