# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

brands = Camera::BRANDS


if User.count.zero?
  User.create(email: 'setbon.martin@gmail.com', password: "123123")
  User.create(email: 'ayush@example.com', password: "123123")
  User.create(email: 'jedd@example.com', password: "123123")

end

Camera.destroy_all

cameras = [
  { brand: 'Sony', model: 'Alpha 7C', description: 'Compact full-frame mirrorless camera.', price: 1200, user_id: User.all.sample.id, photo: "https://img1.kakaku.k-img.com/Images/news_icv/660x495/2023083/20230830103910_227_.jpg" },
  { brand: 'Canon', model: 'EOS R5', description: 'High-performance mirrorless camera with 8K video.', price: 3800, user_id: User.all.sample.id, photo: "https://canon.jp/-/media/Project/Canon/CanonJP/Website/corporate/newsrelease/2020/2020-07/photo-library/eos-r5.png?la=ja-JP&hash=8E086DC8A213C4C7064E91246CBAD435" },
  { brand: 'Nikon', model: 'Z6 II', description: 'Advanced mirrorless camera with 24.5 MP sensor.', price: 2000, user_id: User.all.sample.id, photo: "https://item-shopping.c.yimg.jp/i/n/asanocamera_nikonz6ii24120kit" },
  { brand: 'Fujifilm', model: 'X-T4', description: 'Mirrorless digital camera with 26.1 MP sensor.', price: 1700, user_id: User.all.sample.id, photo: "https://img1.kakaku.k-img.com/images/smartphone/icv/l_J0000032431.jpg" },
  { brand: 'Sony', model: 'A6400', description: 'Compact mirrorless camera with a fast autofocus system.', price: 900, user_id: User.all.sample.id, photo: "https://m.media-amazon.com/images/I/81XeVWWyUUL.jpg" },
  { brand: 'Canon', model: 'EOS 90D', description: 'High-resolution DSLR with 32.5 MP sensor.', price: 1300, user_id: User.all.sample.id, photo: "https://img.my-best.com/product_images/959f299333564520060f0bcce62c6d43?ixlib=rails-4.3.1&q=70&lossless=0&w=1200&h=900&fit=fill&fill=solid&fill-color=FFFFFF&s=8d148ae207f3565ace3d923c331d4ef0" },
  # { brand: 'Nikon', model: 'D850', description: 'DSLR with 45.7 MP full-frame sensor and 4K UHD video.', price: 3000, user_id: User.all.sample.id, photo: "https://www.mapcamera.com/mimage/item/336/4960759149336/3/l.jpg" },
  { brand: 'Fujifilm', model: 'X100V', description: 'Premium compact camera with a fixed 23mm lens.', price: 1400, user_id: User.all.sample.id, photo: "https://m.media-amazon.com/images/I/91d35l-tccL.jpg" },
  { brand: 'Sony', model: 'FX3', description: 'Cinema camera designed for filmmakers, featuring 4K video.', price: 3800, user_id: User.all.sample.id, photo: "https://cdn-ak.f.st-hatena.com/images/fotolife/s/sumizoon/20210211/20210211230003.jpg" }
]

cameras.each do |attributes|
  file = URI.parse(attributes[:photo]).open
  attributes.delete(:photo)
  camera = Camera.new(attributes)
  camera.photo.attach(io: file, filename: "camera.png", content_type: "image/png")
  camera.save
  puts "#{camera.model} camera wa created"
end

puts "9 cameras have been successfully seeded!"
