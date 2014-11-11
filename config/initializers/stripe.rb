Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_SECRET_TEST'],
  :secret_key      => ENV['STRIPE_PUB_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]