# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Seeding data...'
puts 'Creating amenities...'
amenities = [
  { name: 'Internet', code: 'internet' },
  { name: 'TV', code: 'tv' },
  { name: 'Washing Machine', code: 'washing_machine' },
  { name: 'Dishwasher', code: 'dishwasher' },
  { name: 'Parking', code: 'parking' },
  { name: 'Gym', code: 'gym' },
  { name: 'Swimming Pool', code: 'swimming_pool' },
  { name: 'Air Conditioning', code: 'air_conditioning' },
  { name: 'Heating', code: 'heating' },
  { name: 'Wifi', code: 'wifi' }
]

amenities.each do |amenity|
  Amenity.find_or_create_by!(name: amenity[:name], code: amenity[:code])
end
puts 'Done!'