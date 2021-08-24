class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]

  def index
    search = params[:search][:query].capitalize
    if search == ""
      @items = Item.all
    else
      @items = Item.where("name LIKE ? or description LIKE ? or category LIKE ?",
                          "%#{search}%", "%#{search}%", "%#{search}%")
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
