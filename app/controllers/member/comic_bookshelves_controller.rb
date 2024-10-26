class Member::ComicBookshelvesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comic = Comic.find(params[:comic_id])
    current_user.comic_bookshelves.create(comic: @comic)
    flash[:success] = "漫画を本棚に追加しました。"
    redirect_to comics_path
  end

  def destroy
    @comic = Comic.find(params[:id])
    bookshelf = current_user.comic_bookshelves.find_by(comic: @comic)
    bookshelf.destroy if bookshelf
    flash[:success] = "漫画を本棚から削除しました。"
    redirect_to comics_path
  end
end
