##################################
#####    Seed The Program    #####
##################################
require "open-uri"
LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
puts "---------------------------------------------"
puts "Cleaning database..."
puts "---------------------------------------------"
Item.delete_all
User.delete_all
Booking.delete_all

#################################
#####     Helper Method     #####
#################################
def attach_photo(object, url, item = true)
  file = URI.open(url)
  if item
    object.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  else
    object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
  end
end

###################################
#####     Creates 4 Users     #####
###################################
puts "---------------------------------------------"
puts "Creating users..."
puts "---------------------------------------------"

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
puts "---------------------------------------------"
puts "Creating items..."
puts "---------------------------------------------"
surfboard = Item.new(name: 'Surfboard',
                     category: 'Surf',
                     price: 23,
                     description: LOREM,
                     user: users.sample)
attach_photo(surfboard, 'https://images.unsplash.com/photo-1475136863666-2149d427c1d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VyZmJvYXJkfHx8fHx8MTYyOTk2Njg5OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(surfboard, 'https://images.unsplash.com/photo-1488462173947-c03971a64ec7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VyZmJvYXJkfHx8fHx8MTYyOTk2NjkxNw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

skiboots = Item.new(name: 'Ski Boots',
                    category: 'Winter Sports',
                    price: 10,
                    description: LOREM,
                    user: users.sample)
attach_photo(skiboots, 'https://www.powderlife.com/wp-content/uploads/2019/02/niseko-ski-boot-flex-boot-solutions-03.jpg')
attach_photo(skiboots, 'https://images.unsplash.com/photo-1546180303-8cd6a7ef66b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c2tpfHx8fHx8MTYyOTk2Njk1OA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

wetsuit = Item.new(name: 'Wet Suit',
                   category: 'Dive',
                   price: 8,
                   description: LOREM,
                   user: users.sample)
attach_photo(wetsuit, 'https://www.leisurepro.com/blog/wp-content/uploads/2018/06/shutterstock_274871849.jpg')
attach_photo(wetsuit, 'https://images.unsplash.com/photo-1628791442883-3751c507a719?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8d2V0c3VpdHx8fHx8fDE2Mjk5NjcwNzI&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

snowboard = Item.new(name: 'Snowboard',
                     category: 'Winter Sports',
                     price: 19,
                     description: LOREM,
                     user: users.sample)
attach_photo(snowboard, 'https://images.unsplash.com/photo-1522445263200-1b4b91053db8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c25vd2JvYXJkfHx8fHx8MTYyOTk2NzA5NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(snowboard, 'https://images.unsplash.com/photo-1518608774889-b04d2abe7702?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c25vd2JvYXJkfHx8fHx8MTYyOTk2NzE3NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

parachute = Item.new(name: 'Parachute',
                     category: 'Other',
                     price: 26,
                     description: LOREM,
                     user: users.sample)
attach_photo(parachute, 'https://images.unsplash.com/photo-1620589229333-0bbc4e777a4f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8cGFyYWNodXRlfHx8fHx8MTYyOTk2NzE4OA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(parachute, 'https://images.unsplash.com/photo-1562278996-23d19978be53?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8cGFyYWNodXRlfHx8fHx8MTYyOTk2NzIwMQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

backpack = Item.new(name: 'Backpack',
                    category: 'Trek',
                    price: 5,
                    description: LOREM,
                    user: users.sample)
attach_photo(backpack, 'https://images.unsplash.com/photo-1559195690-236f5fab61a9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YmFja3BhY2t8fHx8fHwxNjI5OTY3MjI4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(backpack, 'https://images.unsplash.com/photo-1596116216974-4da48d14620f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YmFja3BhY2t8fHx8fHwxNjI5OTY3MjM4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

helmet = Item.new(name: 'Helmet',
                  category: 'Bike',
                  price: 3,
                  description: LOREM,
                  user: users.sample)
attach_photo(helmet, 'https://images.unsplash.com/photo-1602614015538-89e50df1284c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8aGVsbWV0fHx8fHx8MTYyOTk2NzI1NQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(helmet, 'https://images.unsplash.com/photo-1612311485995-72121b495abb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8aGVsbWV0fHx8fHx8MTYyOTk2NzI3MA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

bikeframe = Item.new(name: 'Bike Frame',
                     category: 'Bike',
                     price: 32,
                     description: LOREM,
                     user: users.sample)
attach_photo(bikeframe, 'https://images.unsplash.com/photo-1586481184655-a2bdb8e413ff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YmlrZXx8fHx8fDE2Mjk5NjczMDA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(bikeframe, 'https://images.unsplash.com/photo-1555671264-19bbb3d58321?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8YmlrZXx8fHx8fDE2Mjk5NjczNDc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

bikepedals = Item.new(name: 'Bike Pedals',
                      category: 'Bike',
                      price: 11,
                      description: LOREM,
                      user: users.sample)
attach_photo(bikepedals, 'https://bikepacking.com/wp-content/uploads/2013/11/2013-11-bike-touring-pedals-main.jpg')
attach_photo(bikepedals, 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/1/cliplesspedals-0-1515510722.jpg?crop=1.00xw:0.788xh;0,0.212xh&resize=1200:*')

kayak = Item.new(name: 'Kayak',
                 category: 'Other',
                 price: 11,
                 description: LOREM,
                 user: users.sample)
attach_photo(kayak, 'https://images.unsplash.com/photo-1588472235309-a3f64708b7a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8a2F5YWt8fHx8fHwxNjI5OTY3NTA4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')
attach_photo(kayak, 'https://images.unsplash.com/photo-1576723175466-420a9b5324b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8a2F5YWt8fHx8fHwxNjI5OTY3NTIx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080')

items = [surfboard, skiboots, wetsuit, snowboard, parachute, backpack, helmet, bikeframe, bikepedals, kayak]

#############################################
#####     Saves all items to the DB     #####
#############################################
items.each do |item|
  item.save!
  puts "Successfully added: #{item.user.first_name}'s #{item.name}"
end

puts "---------------------------------------------"
puts "Seed complete"
puts "---------------------------------------------"
