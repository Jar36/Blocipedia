class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  private
    
    def user_not_authorized
      flash[:alert] = "I'm sorry but you do not have authorization to do that."
      redirect_to (request.referrer || root_path)
    end
  # before_action :authenticate_user!
end
