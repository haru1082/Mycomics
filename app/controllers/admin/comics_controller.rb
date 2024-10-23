class Admin::ComicsController < ApplicationController

  def new
    @comic = Comic.new
    @genres = Genre.all
  end
  
  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      flash[:success] = "漫画が正常に登録されました。"
      redirect_to admin_comics_path
    else
      @genres = Genre.all
      render 'new'
    end
  end
  
  def show
    @comic = Comic.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:id])
    @genres = Genre.all
  end

  def update
  end

  def destroy
  end
  
  def comic_params
    params.require(:comic).permit(:item_image, :title, :volume, :next_date)
  end
  
end
