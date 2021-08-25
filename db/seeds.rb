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

hash = [['Water', 'Surfboard'], ['Snow', 'Ski Boots'], ['Water', 'Wet Suit'], ['Snow', 'Snowboard'],
        ['Free Fall', 'Parachute'], ['Mountain', 'Harness'], ['Mountain', 'Helmet'], ['Mountain', 'Bike Frame'], ['Mountain', 'Bike Pedals'], ['Water', 'Kayak']]

25.times do
  item = Item.new(
    name: hash.sample[1],
    description: 'This is a really good description for this item.',
    price: (5..50).to_a.sample,
    category: hash.sample[0],
    user: [user1, user2].sample
  )
  file = URI.open('https://source.unsplash.com/featured/?sport')
  item.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  item.save!
  puts "Successfully added item: #{item.name}"
end

puts "---------------------------------------------"
puts "Added #{Item.count} items"
puts "---------------------------------------------"
