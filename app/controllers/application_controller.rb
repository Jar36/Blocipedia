class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery
  # before_action :authenticate_user!
end
