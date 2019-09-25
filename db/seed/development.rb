(30 - Branch.count).times do
  branch_name = Faker::Name.unique.name
  address     = Faker::Address.state
  phone       = Faker::PhoneNumber
  township    = Faker::Address.unique.city
  status      = %i[active inactive].sample
  capability  = %i[online offline].sample
  category    = %i[Home Store].sample
  lat         = Faker::Number.decimal(l_digits: 3, r_digits: 3)
  lng         = Faker::Number.decimal(l_digits: 3, r_digits: 3)
  Branch.create!(branch_name: branch_name, address: address, phone: phone, township: township, status: status, capability: capability, category: category, lat: lat, lng: lng)
end
