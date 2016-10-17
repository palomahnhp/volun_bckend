require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM = 100
PROJECT_TYPES_NUM = 3
DISTRICTS_NUM = 10
ACTIVITIES_NUM = 10
SCOPES_NUM = 10

PROJECT_TYPE_NAMES = ['Servicios Sociales', 'Centros de mayores', 'Permanentes', 'Puntuales', 'Entidades', 'Subvencionados']

puts "Creando tipos de proyectos"
(1..PROJECT_TYPES_NUM).each do |n|
  PROJECT_TYPE_NAMES.each do |pt_name|
    ProjectType.create!(name: "#{pt_name} ##{n}")
  end
end

puts "Creando ámbitos"
(1..SCOPES_NUM).each do |n|
  Scope.create!(name: Faker::Company.profession)
end

puts "Creando distritos"
DISTRICTS_NUM.times do
  District.create!(name: Faker::Address.city)
end

puts "Creando projectos"
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

User.first_or_initialize(email: 'admin@email.com',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1')
  .save!
