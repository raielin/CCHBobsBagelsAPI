class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.create(menu_item_params)
  end

  private
  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :menu_id)
  end
end
