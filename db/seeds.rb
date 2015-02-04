# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Vendor.delete_all
Distributor.delete_all
Employee.delete_all


3.times do
  Vendor.create!(
    name: Faker::Company.name ,
    address: Faker::Address.street_address,
  )
  Distributor.create!(
    name: Faker::Company.name ,
    address: Faker::Address.street_address,
  )
  Employee.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
  )
end
