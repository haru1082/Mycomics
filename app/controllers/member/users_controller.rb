class Member::UsersController < ApplicationController
  before_action :authenticate_customer!
  
  def edit
    @user = current_user
  end 
  
  def show
    @user = current_user
  end 
  
  def update
  end 
  
  def withdraw
  end 
  
end
