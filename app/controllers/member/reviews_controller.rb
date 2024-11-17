class Member::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comic, only: [:create, :edit, :update, :destroy]

  def new
    @review = Review.new
  end 
  
  # def create
  #   @review = Review.new(review_params)
  #   @review.score = Language.get_data(review_params[:body])
  #   @review.user_id = current_user.id
  #   if @review.save
  #     flash[:review] = "投稿に成功しました。"
  #     redirect_to reviews_path
  #   else
  #     flash.now[:alert] = "投稿に失敗しました。"
  #     render "new"
  #   end 
  # end
  
  def create
    @review = @comic.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:success] = "レビューを投稿しました。"
    else
      flash[:error] = "レビューの投稿に失敗しました。"
    end
    redirect_to comic_path(@comic)
  end
    
  def index 
    @reviews = current_user.reviews
    @comic = Comic.find(params[:comic_id]) if params[:comic_id].present?
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
  
  def set_comic
    @comic = Comic.find(params[:comic_id])
  end
  
  def review_params
    params.require(:review).permit(:title, :body)
  end 
end
