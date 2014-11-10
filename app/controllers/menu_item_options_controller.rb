class MenuItemOptionsController < ApplicationController
  def index
    @menu_item_options = MenuItemOption.all
  end

  def show
    @menu_item_option = MenuItemOption.find(params[:id])
  end

  def create
    @menu_item_option = MenuItemOption.create(menu_item_option_params)
  end

  private
  def menu_item_option_params
    params.require(:menu_item_option).permit(:name, :price, :included, :menu_item_id)
  end

end
