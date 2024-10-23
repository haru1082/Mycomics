class Member::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end 
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:review] = "投稿に成功しました。"
      redirect_to reviews_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render "new"
    end 
  end
    
  def index 
    @reviews = Review.all
  end 
  
  def show
    @review = Review.find(params[:id])
  end 
  
  def edit
    @review = Review.find(params[:id])
  end 
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
       flash[:review_show] = "投稿内容が更新されました。"
       redirect_to review_path(@review)
    else
       flash[:review_edit] = "投稿内容の更新に失敗しました。"
       render "edit"
    end 
  end 
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end 
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body)
  end 
end
