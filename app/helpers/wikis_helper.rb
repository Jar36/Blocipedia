module WikisHelper
  def user_is_premium 
    current_user && current_user.premium? || current_user && current_user.admin?
  end
  
  def authorize_user
    # current_user == wiki.user_id || current_user.admin?
  end
  
  def private_wiki
   # wiki(params[:private])
  end
  
end
