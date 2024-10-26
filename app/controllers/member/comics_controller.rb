class Member::ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
    #@comic = @comics.page(params[:page]).per(10)
  end 
  
  def show
    @comic = Comics.find(params[:id])
  end 
  
  def add_to_bookshelf
    @comic = Comic.find(params[:comic_id])
    current_user.bookshelves.create(comic: @comic) unless current_user.bookshelves.exists?(comic: @comic)
    redirect_to comics_path, notice: '漫画を本棚に追加しました。'
  end

  def remove_from_bookshelf
    @comic = Comic.find(params[:comic_id])
    current_user.bookshelves.find_by(comic: @comic)&.destroy
    redirect_to comics_path, notice: '漫画を本棚から削除しました。'
  end 
  
  
end
