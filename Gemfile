source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.2.0.beta2'
# gem 'stripe-rails'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'rails-api'
gem 'jbuilder'
gem 'bcrypt', '~> 3.1.2'
gem 'pg'
gem 'rack-cors', :require => 'rack/cors'
gem 'responders', '~> 2.0.2'
gem 'newrelic_rpm'

group :production do
  gem 'rails_12factor', group: :production
end

gem 'spring', :group => :development

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'dotenv-rails'
end

group :test do
  gem 'shoulda-matchers', require: false
end

gem 'bullet', group: :development

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
