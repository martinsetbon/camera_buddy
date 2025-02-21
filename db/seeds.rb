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
    description: "The Sony Alpha 7C is a compact, full-frame mirrorless camera that packs powerful performance in a small form factor. It offers incredible image quality, a fast autofocus system, and 4K video recording. Perfect for photographers and content creators who need both portability and professional-level features, making it ideal for travel, street, and portrait photography.",
    price: 50,
    user_id: User.all.sample.id,
    photo: "https://img1.kakaku.k-img.com/Images/news_icv/660x495/2023083/20230830103910_227_.jpg",
    address: "1 Chome-2 Nishishinjuku, Shinjuku City, Tokyo 160-0023"
  },
  {
    brand: 'Canon',
    model: 'EOS R5',
    description: "The Canon EOS R5 is a high-performance mirrorless camera that combines professional-level features with cutting-edge technology. With a 45MP full-frame sensor, 8K video recording, and fast autofocus, it’s perfect for both photographers and videographers. Whether you're shooting landscapes, portraits, or fast-action scenes, the R5 delivers outstanding image quality and versatility in any situation.",
    price: 47,
    user_id: User.all.sample.id,
    photo: "https://canon.jp/-/media/Project/Canon/CanonJP/Website/corporate/newsrelease/2020/2020-07/photo-library/eos-r5.png?la=ja-JP&hash=8E086DC8A213C4C7064E91246CBAD435",
    address: "2 Chome-15-45 Mita, Minato City, Tokyo 108-0073"
  },
  {
    brand: 'Nikon',
    model: 'Z6 II',
    description: "The Nikon Z6 II is a versatile mirrorless camera designed for both professionals and enthusiasts. It features a 24.5MP full-frame sensor, 4K UHD video recording, and exceptional low-light performance. With improved autofocus and dual card slots, it's a perfect choice for photographers looking to capture stunning images and video in a wide range of conditions, from fast action to detailed landscapes.",
    price: 70,
    user_id: User.all.sample.id,
    photo: "https://item-shopping.c.yimg.jp/i/n/asanocamera_nikonz6ii24120kit",
    address: "1 Chome-3-丁目 Tsukishima, Chuo City, Tokyo"
  },
  {
    brand: 'Fujifilm',
    model: 'X-T4',
    description: "The Fujifilm X-T4 is a powerful mirrorless camera that combines superior image quality with advanced video features. Equipped with a 26.1MP APS-C sensor and 4K video recording at 60fps, it's a versatile tool for creators. The in-body image stabilization (IBIS) ensures smooth, steady shots in any situation, while the classic design and retro controls provide a tactile shooting experience.",
    price: 60,
    user_id: User.all.sample.id,
    photo: "https://img1.kakaku.k-img.com/images/smartphone/icv/l_J0000032431.jpg",
    address: "4 Chome-1-1 Shimomeguro, Meguro City, Tokyo 153-0064"
  },
  {
    brand: 'Sony',
    model: 'A6400',
    description: "The Sony A6400 is a compact, mirrorless camera with a 24.2MP sensor and lightning-fast autofocus, making it a perfect choice for content creators and vloggers. With 4K video recording, real-time eye autofocus, and a 180-degree flip screen, it’s ideal for capturing high-quality photos and videos. The A6400’s compact design and impressive feature set make it a standout option for any creative pursuit.",
    price: 42,
    user_id: User.all.sample.id,
    photo: "https://m.media-amazon.com/images/I/81XeVWWyUUL.jpg",
    address: "4 Chome-28-16 Higashimukojima, Sumida City, Tokyo 131-0032"
  },
  {
    brand: 'Canon',
    model: 'EOS 90D',
    description: "The Canon EOS 90D is a DSLR that combines high resolution with fast performance. Featuring a 32.5MP APS-C sensor, 10fps continuous shooting, and 4K UHD video, it's a fantastic option for both stills and video. Whether capturing fast-moving subjects or shooting detailed landscapes, the EOS 90D offers sharp, vibrant images and seamless autofocus, making it a great choice for enthusiasts and professionals alike.",
    price: 100,
    user_id: User.all.sample.id,
    photo: "https://img.my-best.com/product_images/959f299333564520060f0bcce62c6d43?ixlib=rails-4.3.1&q=70&lossless=0&w=1200&h=900&fit=fill&fill=solid&fill-color=FFFFFF&s=8d148ae207f3565ace3d923c331d4ef0",
    address: "1 Chome-23-15 Kamiogi, Suginami City, Tokyo 167-0043"
  },
  {
    brand: 'Fujifilm',
    model: 'X100V',
    description: "The Fujifilm X100V is a premium compact camera with a fixed 23mm lens and a 26.1MP APS-C sensor. With its classic design and tactile controls, it’s a joy to use. The X100V features impressive image quality, 4K video, and enhanced autofocus, making it perfect for street photography, travel, and everyday shooting. Its compact size, combined with powerful features, ensures it’s always ready to capture the moment.",
    price: 110,
    user_id: User.all.sample.id,
    photo: "https://m.media-amazon.com/images/I/91d35l-tccL.jpg",
    address: "1 Chome-9-1 Kugayama, Suginami City, Tokyo 168-0082"
  },
  {
    brand: 'Sony',
    model: 'FX3',
    description: "The Sony FX3 is a compact, cinema-quality camera designed for professional filmmakers. With a 10.2MP full-frame sensor, 4K video recording, and high dynamic range, the FX3 delivers exceptional video quality. The small form factor, combined with advanced features like real-time eye autofocus and impressive image stabilization, makes it the ideal choice for filmmakers who need to shoot in a variety of environments, from studio to on-the-go.",
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
