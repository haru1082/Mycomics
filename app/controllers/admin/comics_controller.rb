class Admin::ComicsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  def new
    @comic = Comic.new
    @genres = Genre.all
  end

  def create
    @comic = Comic.new(comic_params)
    @genres = Genre.all
    if @comic.save
      flash[:comic_new] = "漫画が正常に登録されました。"
      redirect_to admin_top_path
    else
      flash.now[:comic_alert] = "漫画の登録に失敗しました。"
      render :new
    end
  end

  def show
    @bookshelves = @comic.bookshelves
    @user_count = @bookshelves.count
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @comic.update(comic_params)
      flash[:comic_show] = "漫画情報が更新されました。"
      redirect_to admin_comic_path(@comic)
    else
      flash.now[:comic_alert] = "漫画情報の更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comic.destroy
    flash[:comic_] = "漫画が削除されました。"
    redirect_to admin_comics_path
  end

  private
  
  def set_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params
    params.require(:comic).permit(:genre_id, :title, :volume, :next_date, :image)
  end

end