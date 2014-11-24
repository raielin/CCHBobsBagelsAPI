class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:order_items).all
  end

  def show
    @order = Order.find(params[:id])
  end

 def create
    @order = Order.create(order_params)
    Stripe.api_key = ENV["STRIPE_SECRET_TEST"]
    token = params[:order][:access_token]
    price = (params[:order][:price].to_i)*100
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => price, # amount in cents, again
        :currency => "usd",
        :card => token,
      )
      rescue Stripe::CardError => e
      # The card has been declined
    end

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      head :no_content
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    head :no_content
  end


  private

  def order_params
    params.require(:order).permit(:price, :street, :city, :state, :zipcode, :access_token, :name, order_items_attributes:[:id, :name, :price])
  end
end

