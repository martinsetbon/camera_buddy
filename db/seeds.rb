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
  {
    brand: 'Sony',
    model: 'Alpha 7C',
    description: "A compact, full-frame mirrorless camera that delivers stunning image quality.",
    price: 50,
    user_id: User.all.sample.id,
    photo: "https://img1.kakaku.k-img.com/Images/news_icv/660x495/2023083/20230830103910_227_.jpg",
    address: "1 Chome-2 Nishishinjuku, Shinjuku City, Tokyo 160-0023"
  },
  {
    brand: 'Canon',
    model: 'EOS R5',
    description: "this powerhouse camera is perfect for serious photographers.",
    price: 47,
    user_id: User.all.sample.id,
    photo: "https://canon.jp/-/media/Project/Canon/CanonJP/Website/corporate/newsrelease/2020/2020-07/photo-library/eos-r5.png?la=ja-JP&hash=8E086DC8A213C4C7064E91246CBAD435",
    address: "2 Chome-15-45 Mita, Minato City, Tokyo 108-0073"
  },
  {
    brand: 'Nikon',
    model: 'Z6 II',
    description: 'Advanced mirrorless camera with 24.5 MP sensor.',
    price: 70,
    user_id: User.all.sample.id,
    photo: "https://item-shopping.c.yimg.jp/i/n/asanocamera_nikonz6ii24120kit",
    address: "1 Chome-3-丁目 Tsukishima, Chuo City, Tokyo"
  },
  {
    brand: 'Fujifilm',
    model: 'X-T4',
    description: 'Mirrorless digital camera with 26.1 MP sensor.',
    price: 60,
    user_id: User.all.sample.id,
    photo: "https://img1.kakaku.k-img.com/images/smartphone/icv/l_J0000032431.jpg",
    address: "4 Chome-1-1 Shimomeguro, Meguro City, Tokyo 153-0064"
  },
  {
    brand: 'Sony',
    model: 'A6400',
    description: 'Compact mirrorless camera with a fast autofocus system.',
    price: 42,
    user_id: User.all.sample.id,
    photo: "https://m.media-amazon.com/images/I/81XeVWWyUUL.jpg",
    address: "4 Chome-28-16 Higashimukojima, Sumida City, Tokyo 131-0032"
  },
  {
    brand: 'Canon',
    model: 'EOS 90D',
    description: 'High-resolution DSLR with 32.5 MP sensor.',
    price: 100,
    user_id: User.all.sample.id,
    photo: "https://img.my-best.com/product_images/959f299333564520060f0bcce62c6d43?ixlib=rails-4.3.1&q=70&lossless=0&w=1200&h=900&fit=fill&fill=solid&fill-color=FFFFFF&s=8d148ae207f3565ace3d923c331d4ef0",
    address: "1 Chome-23-15 Kamiogi, Suginami City, Tokyo 167-0043"
  },
  {
    brand: 'Fujifilm',
    model: 'X100V',
    description: 'Premium compact camera with a fixed 23mm lens.',
    price: 110,
    user_id: User.all.sample.id,
    photo: "https://m.media-amazon.com/images/I/91d35l-tccL.jpg",
    address: "1 Chome-9-1 Kugayama, Suginami City, Tokyo 168-0082"
  },
  {
    brand: 'Sony',
    model: 'FX3',
    description: 'Cinema camera designed for filmmakers, featuring 4K video.',
    price: 85,
    user_id: User.all.sample.id,
    photo: "https://cdn-ak.f.st-hatena.com/images/fotolife/s/sumizoon/20210211/20210211230003.jpg",
    address: "1 Chome-17-12 Kyodo, Setagaya City, Tokyo 156-0052"
  }
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
