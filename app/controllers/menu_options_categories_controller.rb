class MenuOptionsCategoriesController < ApplicationController
  def index
    @menu_options_categories = MenuOptionsCategory.all
  end

  def show
    @menu_options_category = MenuOptionsCategory.find(params[:id])
  end

  def create
    @menu_options_category = MenuOptionsCategory.create(menu_options_category_params)
  end

  private
  def menu_options_category_params
    params.require(:menu_options_category).permit(:name)
  end
end
