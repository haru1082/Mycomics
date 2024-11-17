class Member::ComicBookshelvesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comic = Comic.find(params[:comic_id])
    current_user.bookshelves.create!(comic_id: @comic.id)
    flash[:success] = "漫画を本棚に追加しました。"
    redirect_to comics_path
  end
  
  def destroy
    @comic = Comic.find(params[:comic_id])
    bookshelf = current_user.bookshelves.find_by(comic_id: @comic.id)
    bookshelf.destroy if bookshelf
    flash[:success] = "漫画を本棚から削除しました。"
    redirect_to comics_path
  end
end
