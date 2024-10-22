class Member::UsersController < ApplicationController

  
  def show
    @user = current_user
  end 
  
  def edit
    @user = current_user
  end 
  
  def update
    @user = current_user
    if @user.update(user_params)
       flash[:user_show] = "会員情報が更新されました。"
       redirect_to user_path(@user)
    else
       flash[:user_edit] = "会員情報の更新に失敗しました。"
       render 'edit'
    end
  end 
  
  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end 
  
  private
   def user_params
     params.require(:user).permit(:nickname, :email)
   end
  
end
