module WikisHelper
  def user_is_premium 
    current_user && current_user.premium? || current_user && current_user.admin?
  end
end
