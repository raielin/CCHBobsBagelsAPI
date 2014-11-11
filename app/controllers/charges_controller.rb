class ChargesController < ApplicationController

  def new
  end

  def create

    @amount = 10

    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card: params[:access_token]
    )

    save_stripe_customer_id(user, customer.id)

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

end
