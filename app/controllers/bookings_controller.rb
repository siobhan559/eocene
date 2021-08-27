class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.user = current_user
    if @booking.save
      @booking.total_price = @item.price * (@booking.end_date - @booking.start_date).to_i
      redirect_to booking_path(@booking)
    else
      render "items/show"
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
