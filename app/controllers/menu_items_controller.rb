class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      render json: @menu_item, status: :created, location @menu_item
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(menu_item_params)
      head :no_content
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    head :no_content
  end

  private
  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :menu_id)
  end
end
