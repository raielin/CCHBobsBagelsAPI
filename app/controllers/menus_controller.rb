class MenusController < ApplicationController

  def index
    @menus = Menu.includes(:menu_items).all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      render json: @menu, status: :created, location: @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      head :no_content
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    head :no_content
  end

  private
  def menu_params
    params.require(:menu).permit(:name)
  end

end
