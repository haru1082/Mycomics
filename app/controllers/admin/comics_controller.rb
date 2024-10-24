class Admin::ComicsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @comic = Comic.new
    # @genres = Genre.all
  end

  def create
    comic = Comic.new(comic_params)
    if comic.save
      flash[:comic_new] = "漫画が正常に登録されました。"
      redirect_to top_path(@comic)
    else
      flash[:comic_alert] = "漫画の登録に失敗しました。"
      render "new"
    end
  end

  def show
    @comic = current_user
  end

  def edit
    @comic = Comic.find(params[:id])
    # @genres = Genre.all
  end

  def update
  end

  def destroy
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :volume, :next_date)
  end

end
