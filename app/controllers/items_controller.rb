class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    session[:search] = params.dig(:search, :query)
    if params[:search_query] == ""
      @items = Item.all
    elsif params[:search_query] == nil
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
    when "Highest" then @items = @items.order(price: :desc)
    when "Lowest" then @items = @items.order(price: :asc)
    else
      @items
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    redirect_to item_path(@item)
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, photos: [])
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
