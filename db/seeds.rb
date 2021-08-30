# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if UserGroup.none?
  UserGroup.create(name: 'Admin', super_admin: true)
  UserGroup.create(name: 'Guest')
end

if User.none?
  User.create(email: 'abc@com.tw', password: '12345678', password_confirmation: '12345678', user_group: UserGroup.first)
end
