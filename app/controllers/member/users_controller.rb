class Member::UsersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @user = current_user
    
  end 
  
  def edit
    @user = current_user
  end 
  
  def update
  end 
  
  def withdraw
  end 
  
end
