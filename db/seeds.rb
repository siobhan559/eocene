puts "Cleaning all items"
Item.delete_all
puts "Items cleaned"

50.times do
  item = Item.new(
    name: %w[skis boots surfboard snowboard parachute rope helmet bike-frame bike-pedals].sample.capitalize,
    description: Faker::Quote.famous_last_words,
    price: (5..50).to_a.sample,
    category: %w[surf trek mountain-climb ski snowboard mountain-bike skydive].sample.capitalize,
    user: User.first
  )
  item.save!
end

puts "Added #{Item.count} items"
