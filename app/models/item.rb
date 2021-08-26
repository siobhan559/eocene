class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: true
  validates :category, presence: true
  # validates :photos, presence: true

  CATEGORY = ['Surf', 'Winter Sports', 'Dive', 'Trek', 'Bike', 'Others']
  PRICE = ['Highest', 'Lowest']
  RATING = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars']
end
