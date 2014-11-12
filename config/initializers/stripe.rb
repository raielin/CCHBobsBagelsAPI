require "stripe"

if Rails.env == 'development' || Rails.env == 'staging'
  Stripe.api_key = ENV["STRIPE_SECRET_TEST"]
  STRIPE_PUB_KEY = "pk_test_0fbtu0To5Q8TurGcFy6XZ505"
elsif Rails.env == 'production'
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
  STRIPE_PUB_KEY = "pk_live_IoRjUJe9XLoURIzzL6KgURw2"
end