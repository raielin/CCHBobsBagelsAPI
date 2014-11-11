class OrderItemOptionsController < ApplicationController

  def index
    @order_item_options = OrderItemOption.all
  end

  def show
    @order_item_option = OrderItemOption.find(params[:id])
  end

 def create
    @order_item_option = OrderItemOption.new(order_item_option_params)

    if @order_item_option.save
      render json: @order_item_option, status: :created, location: @order_item_option
    else
      render json: @order_item_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_item_options/1
  # PATCH/PUT /order_item_options/1.json
  def update
    @order_item_option = OrderItemOption.find(params[:id])

    if @order_item_option.update(order_item_option_params)
      head :no_content
    else
      render json: @order_item_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_item_options/1
  # DELETE /order_item_options/1.json
  def destroy
    @order_item_option = OrderItemOption.find(params[:id])
    @order_item_option.destroy

    head :no_content
  end


  private

  def order_item_option_params
    params.require(:order_item_option).permit(:id, :name, :price, :order_item_id)
  end

end
