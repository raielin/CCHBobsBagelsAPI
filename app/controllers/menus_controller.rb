class MenusController < ActionController::API

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.create(menu_params)
  end

  private
  def menu_params
    params.require(:menu).permit(:name)
  end
end
