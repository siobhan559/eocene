class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    session[:search] = params.dig(:search, :query)
    if session[:search] == ""
      @items = Item.all
    else
      @items = Item.where("name ILIKE ? or description ILIKE ? or category ILIKE ?",
                          "%#{session[:search]}%", "%#{session[:search]}%", "%#{session[:search]}%")
    end
    filters = params.dig(:filters, :category)
    if filters.present?
      @items = @items.where(category: filters)
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
    if @item.save
      redirect_to item_path(@item)
    else
      redirect_to account_path(current_user)
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
