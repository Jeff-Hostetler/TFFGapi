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
