# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new(email: 'admin@admin.com', encrypted_password: Devise::Encryptor.digest(Admin, 'testtest'))
Department.create(name: 'Nursing Assistants')
Department.create(name: 'Nursing ')
Department.create(name: 'Another test Department ')

admin.save!(:validate => false)
