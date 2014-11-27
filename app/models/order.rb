class Order < ActiveRecord::Base
  has_many :order_items
  # Stripe.api_key = ENV["STRIPE_SECRET_TEST"]

  # def charge_customer(token, price)
  #   # Create the charge on Stripe's servers - this will charge the user's card
  #   begin
  #     charge = Stripe::Charge.create(
  #       :amount => price, # amount in cents, again
  #       :currency => "usd",
  #       :card => token,
  #     )
  #     rescue Stripe::CardError => e
  #     # The card has been declined
  #   end
  # end
end
