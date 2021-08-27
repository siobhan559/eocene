class Booking < ApplicationRecord
  # This user is the one buying
  belongs_to :user
  # The item holds the owner user
  belongs_to :item

  validate :positive_range, :available?

  private

  def positive_range
    errors.add(:end_date, "can't be before start date") if start_date.present? && end_date.present? && start_date > end_date
  end

  def available?
    item_bookings = Booking.where(item_id: item.id)
    item_bookings.each do |other|
      errors.add(:start_date, "is unavailable") unless other.end_date < start_date || other.start_date > end_date
    end
  end
end
