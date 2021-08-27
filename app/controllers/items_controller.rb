class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    if params[:search_query].nil?
      session[:search] = params.dig(:search, :query)
      if params[:search_query] == "" || params[:search_query].nil?
        @items = Item.all
      else
        @items = Item.where("name ILIKE ? or description ILIKE ? or category ILIKE ?",
                            "%#{session[:search]}%", "%#{session[:search]}%", "%#{session[:search]}%")
      end

      filters = params.dig(:filters, :category)
      if filters.present? && filters.reject(&:empty?).present?
        @items = @items.where(category: filters)
      end

      sort = params.dig(:filters, :price)
      case sort
      when "Highest first" then @items = @items.order(price: :desc)
      when "Lowest first" then @items = @items.order(price: :asc)
      else
        @items
      end
    elsif params[:search_query] == ""
      @items = Item.all
    else
      @items = Item.where("name ILIKE ? or description ILIKE ? or category ILIKE ?",
                            "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%")
    end

  end

  def show
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render "pages/listings"
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category, photos: [])
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
