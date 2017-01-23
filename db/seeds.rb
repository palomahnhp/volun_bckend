puts "Create admin user if it does not exist"

user = User.first_or_initialize(email: 'admin@madrid.es',
                                password: 'Wordpass1',
                                password_confirmation: 'Wordpass1')
user.save! if user.new_record?