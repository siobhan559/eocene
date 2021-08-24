class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.save
    redirect_to item_path(@item)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
