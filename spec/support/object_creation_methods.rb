def create_vendor
  Vendor.create(
    name: Faker::Name.name ,
    address: Faker::Address.street_address,
  )
end

def create_distributor
  Distributor.create(
    name: Faker::Name.name ,
    address: Faker::Address.street_address,
  )
end

def create_employee
  Employee.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    position: Faker::Name.title,
  )
end

def create_shift(employee, length)
  Shift.create(
  employee_id: employee.id,
  start_time: Time.now,
  end_time: (Time.now + length.hours),
  )
end

def create_another_shift(employee, length)
  Shift.create(
  employee_id: employee.id,
  start_time: (Time.now+1.day),
  end_time: ((Time.now+1.day)+length.hours),
  )
end
