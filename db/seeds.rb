##################################
#####    Seed The Program    #####
##################################
require "open-uri"
LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
puts "---------------------------------------------"
puts "Cleaning the database"
Item.delete_all
User.delete_all
puts "Database has been cleaned"
puts "---------------------------------------------"

###################################
#####     Creates 4 Users     #####
###################################
cesar = User.create(first_name: 'Cesar', last_name: 'Ades', password: 'password', email: 'cesar@seed.com')
attach_photo(cesar, 'https://kitt.lewagon.com/placeholder/users/cesarades', false)

siobhan = User.create(first_name: 'Siobhan', last_name: 'Brown', password: 'password', email: 'siobhan@seed.com')
attach_photo(siobhan, 'https://kitt.lewagon.com/placeholder/users/siobhan559', false)

daniella = User.create(first_name: 'Daniella', last_name: 'Fernandes', password: 'password', email: 'daniella@seed.com')
attach_photo(daniella, 'https://kitt.lewagon.com/placeholder/users/daniellafernandes14', false)

george = User.create(first_name: 'George', last_name: 'kelly', password: 'password', email: 'george@seed.com')
attach_photo(george, 'https://kitt.lewagon.com/placeholder/users/georgek1992', false)

users = [cesar, george, daniella, siobhan]

####################################################
#####     Creates 10 Items in 6 Categories     #####
####################################################
surfboard = Item.new(name: 'Surfboard',
                     category: 'Surf',
                     price: 23,
                     description: LOREM,
                     user: users.sample)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

skiboots = Item.new(
  name: 'Ski Boots',
  category: 'Winter Sports',
  price: 10,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

wetsuit = Item.new(
  name: 'Wet Suit',
  category: 'Dive',
  price: 8,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

snowboard = Item.new(
  name: 'Snowboard',
  category: 'Winter Sports',
  price: 19,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

parachute = Item.new(
  name: 'Parachute',
  category: 'Other',
  price: 26,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

backpack = Item.new(
  name: 'Backpack',
  category: 'Trek',
  price: 5,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

helmet = Item.new(
  name: 'Helmet',
  category: 'Bike',
  price: 3,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

bikeframe = Item.new(
  name: 'Bike Frame',
  category: 'Bike',
  price: 32,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

bikepedals = Item.new(
  name: 'Bike Pedals',
  category: 'Bike',
  price: 11,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

kayak = Item.new(
  name: 'Kayak',
  category: 'Other',
  price: 11,
  description: LOREM,
  user: users.sample
)
attach_photo(surfboard, url)
attach_photo(surfboard, url)

items = [surfboard, skiboots, wetsuit, snowboard, parachute, backpack, helmet, bikeframe, bikepedals, kayak]

#############################################
#####     Saves all items to the DB     #####
#############################################
items.each do |item|
  item.save!
  puts "Successfully added: #{item.user.first_name}'s #{item.name}"
end

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

def attach_photo(object, url, item = true)
  file = URI.open(url)
  if item
    object.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  else
    object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
  end
end
