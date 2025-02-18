# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

brands = Camera::BRANDS


if User.count.zero?
  User.create(email: 'setbon.martin@gmail.com', password: "123123")
  User.create(email: 'ayush@example.com', password: "123123")
  User.create(email: 'jedd@example.com', password: "123123")

end

Camera.create([
  { brand: 'Sony', model: 'Alpha 7C', description: 'Compact full-frame mirrorless camera.', price: 1200, user_id: User.all.sample.id },
  { brand: 'Canon', model: 'EOS R5', description: 'High-performance mirrorless camera with 8K video.', price: 3800, user_id: User.all.sample.id },
  { brand: 'Nikon', model: 'Z6 II', description: 'Advanced mirrorless camera with 24.5 MP sensor.', price: 2000, user_id: User.all.sample.id },
  { brand: 'Fujifilm', model: 'X-T4', description: 'Mirrorless digital camera with 26.1 MP sensor.', price: 1700, user_id: User.all.sample.id },
  { brand: 'Sony', model: 'A6400', description: 'Compact mirrorless camera with a fast autofocus system.', price: 900, user_id: User.all.sample.id },
  { brand: 'Canon', model: 'EOS 90D', description: 'High-resolution DSLR with 32.5 MP sensor.', price: 1300, user_id: User.all.sample.id },
  { brand: 'Nikon', model: 'D850', description: 'DSLR with 45.7 MP full-frame sensor and 4K UHD video.', price: 3000, user_id: User.all.sample.id },
  { brand: 'Fujifilm', model: 'X100V', description: 'Premium compact camera with a fixed 23mm lens.', price: 1400, user_id: User.all.sample.id },
  { brand: 'Sony', model: 'FX3', description: 'Cinema camera designed for filmmakers, featuring 4K video.', price: 3800, user_id: User.all.sample.id }
])

puts "9 cameras have been successfully seeded!"
