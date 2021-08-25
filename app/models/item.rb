class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  CATEGORY = ['Diving', 'Wintersports', 'Trek', 'Surf', 'Bike', 'Others']
  PRICE = ['Highest', 'Lowest']
  RATING = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars']
end
