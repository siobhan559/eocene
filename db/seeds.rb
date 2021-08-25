require "open-uri"

puts "---------------------------------------------"
puts "Cleaning the database"
Item.delete_all
User.delete_all
puts "Database has been cleaned"
puts "---------------------------------------------"

user1 = User.create(
  first_name: 'Seed',
  last_name: 'One',
  password: 'password',
  email: 'one@seed.com'
)

file = URI.open('https://source.unsplash.com/featured/?face')
user1.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')

user2 = User.create(
  first_name: 'Seed',
  last_name: 'Two',
  password: 'password',
  email: 'two@seed.com'
)

file = URI.open('https://source.unsplash.com/featured/?face')
user2.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')

hash = [['Surf', 'Surfboard'], ['Winter Sports', 'Ski Boots'], ['Dive', 'Wet Suit'],
        ['Winter Sports', 'Snowboard'], ['Other', 'Parachute'], ['Trek', 'Backpack'],
        ['Bike', 'Helmet'], ['Bike', 'Bike Frame'], ['Bike', 'Bike Pedals'], ['Other', 'Kayak']]

25.times do
  item = Item.new(
    name: hash.sample[1],
    description: 'This is a really good description for this item.',
    price: (5..50).to_a.sample,
    category: hash.sample[0],
    user: [user1, user2].sample
  )
  2.times do
    file = URI.open("https://source.unsplash.com/featured/?#{item.name}")
    item.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  end
  item.save!
  puts "Successfully added item: #{item.name}"
end

puts "---------------------------------------------"
puts "Added #{Item.count} items"
puts "---------------------------------------------"
