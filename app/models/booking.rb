class Booking < ApplicationRecord
  # This user is the one buying
  belongs_to :user
  # The item holds the owner user
  belongs_to :item
end
