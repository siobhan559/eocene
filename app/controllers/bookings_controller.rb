class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.user = current_user
    @booking.total_price = @item.price * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "items/show"
    end
  end

  def update
  end

  def show
    @booking = Booking.find(params[:id])
    @days = (@booking.end_date - @booking.start_date).to_i
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
