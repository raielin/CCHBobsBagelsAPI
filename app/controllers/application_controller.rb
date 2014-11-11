class ApplicationController < ActionController::API
   include ActionController::ImplicitRender
   # Gives us the number_to_currency method, i.e. number_to_currency(MenuItem.find_by_name("Latte").price)
   include ActionView::Helpers::NumberHelper
end
