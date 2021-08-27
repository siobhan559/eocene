class Booking < ApplicationRecord
  # This user is the one buying
  belongs_to :user
  # The item holds the owner user
  belongs_to :item

  validates :start_date, :end_date, presence: true
  validates :positive_range
  validates :available?

  private

  def positive_range
    return if start_date < end_date
  end

  def available?
    item_bookings = Booking.where(item_id: item.id)
    item_bookings.each do |other|
      return false unless other.end_date < start_date || other.start_date > end_date
    end
    return true
  end
end
