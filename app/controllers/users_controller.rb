class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create 
    
  end
  
  def show 
   
  end
  
  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    flash[:success] = 'OK!'
    redirect_to root_path
  end
end