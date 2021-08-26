class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.user = current_user
    @booking.total_price = 5.00
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render 'items#show'
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
