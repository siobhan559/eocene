# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  item = Item.new(
    name: %w[skiis boots surfboard snowboard parachute rope helmet bike-frame bike-pedals].sample,
    description: Faker::Quote.famous_last_words,
    price: (5..50).to_a.sample,
    category: %w[surf trek mountain-climb skii snowboard mountain-bike skydive].sample,
    user: User.first
  )
  item.save!
end
