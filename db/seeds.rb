# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




puts "Create admin user if it does not exist"

user = User.first_or_initialize(email: 'admin@madrid.es',
                                password: 'Wordpass1',
                                password_confirmation: 'Wordpass1')
user.save! if user.new_record?






