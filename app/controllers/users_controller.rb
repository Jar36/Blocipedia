class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = User.all
  end
  
  def show 
   @user = User.find(params[:id])
  end
  
  def destory 
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end
  
end