class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create 
    
  end
  
  def index
    @user = User.find(params[:email])
  end
  
  def show 
   
  end
end