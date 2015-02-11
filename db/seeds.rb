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
Shift.delete_all


3.times do
  Vendor.create!(
    name: Faker::Company.name ,
    address: Faker::Address.street_address,
  )
  Distributor.create!(
    name: Faker::Company.name ,
    address: Faker::Address.street_address,
  )
  emp = Employee.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
  )
  Shift.create!(
  start_time: Time.now,
  end_time: Time.now + rand(8).hours,
  employee: emp,
  )
  Shift.create(
  start_time: Time.now + 1.day,
  end_time: Time.now + 1.day + rand(8).hours,
  employee: emp,
  )
end
