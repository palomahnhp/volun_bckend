# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Creando usuario administrador..."

User.first_or_initialize(email: 'admin@email.com',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1')
    .save!
