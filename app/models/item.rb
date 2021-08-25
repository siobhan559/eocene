class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  CATEGORY = ['Surf', 'Winter Sports', 'Dive', 'Trek', 'Bike', 'Others']
  PRICE = ['Highest', 'Lowest']
  RATING = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars']
end
