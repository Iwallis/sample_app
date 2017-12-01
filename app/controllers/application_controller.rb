class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # to get functions for using sessions available to our controllers
  include SessionsHelper
end
