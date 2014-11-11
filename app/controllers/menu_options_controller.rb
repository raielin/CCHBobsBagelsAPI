class MenuOptionsController < ApplicationController
  def index
    @menu_options = MenuOption.all
  end

  def show
    @menu_option = MenuOption.find(params[:id])
  end

  def create
    @menu_option = MenuOption.create(menu_option_params)
  end

  private
  def menu_option_params
    params.require(:menu_option).permit(:name, :price, :menu_options_category_id)
  end

end
