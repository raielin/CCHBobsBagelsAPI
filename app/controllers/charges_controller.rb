class ChargesController < ApplicationController

  def new
  end

  def create

    token =  params[:access_token]

    begin
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to charges_path
    end

    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card: token
    )

    save_stripe_customer_id(user, customer.id)

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

end
