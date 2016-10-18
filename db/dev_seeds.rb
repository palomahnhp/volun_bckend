require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM   = 100
DISTRICTS_NUM  = 10
ACTIVITIES_NUM = 10
SCOPES_NUM     = 10

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

puts "Creando Ámbitos"
(1..SCOPES_NUM).each do |n|
  Scope.create!(name: Faker::Company.profession)
end

puts "Creando Distritos"
DISTRICTS.each do |code, name|
  District.create!(code: code, name: name)
end

puts "Creando Projectos"
(1..PROJECTS_NUM).each do |n|
  Project.create!(
    code: Faker::Code.isbn,
    name: Faker::App.name,
    description: Faker::Lorem.sentence,
    registry_date: Faker::Time.between(DateTime.now - 10, DateTime.now),
    start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
    end_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
    city_hall: Faker::Address.city,
    # important: false,
    # status:,
    # assessment:,
    # work_place:,
    manager: Faker::Name.name,
    manager_telf: Faker::PhoneNumber.phone_number,
    voluntaries_num: rand(100),
    # profile:,
    # cooperation_agreement:,
    district_id: District.all.sample.id,
    # proposal_id:,
    project_type_id: ProjectType.all.sample.id
  )
end

puts "Creando usuario administrador..."

User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1').save!