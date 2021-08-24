puts "Cleaning all items"
Item.delete_all
puts "Items cleaned"

user = User.create(
  first_name: 'Cesar',
  last_name: 'Ades',
  password: 'password',
  email: 'email@gmail.com'
)


50.times do
  item = Item.new(
    name: %w[skis boots surfboard snowboard parachute rope helmet bike-frame bike-pedals].sample.capitalize,
    description: Faker::Quote.famous_last_words,
    price: (5..50).to_a.sample,
    category: %w[surf trek mountain-climb ski snowboard mountain-bike skydive].sample.capitalize,
    user: user
  )
  item.save!
end

puts "Added #{Item.count} items"
