module WikisHelper
  def user_is_premium 
    current_user && current_user.premium? || current_user && current_user.admin?
  end
  
  def user_is_not_premium
    current_user && current_user.standard?
  end
  
  
end
