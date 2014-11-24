class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.includes(:order_item_options).all
  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

 def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      render json: @order_item, status: :created, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])

    if @order_item.update(order_item_params)
      head :no_content
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    head :no_content
  end


  private

  def order_item_params
    params.require(:order_item).permit(:id, :name, :price, :special_requests)
  end

end
