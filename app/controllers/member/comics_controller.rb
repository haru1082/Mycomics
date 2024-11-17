class Member::ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
    # タイトル検索
    if params[:title].present?
      @comics = @comics.where('title LIKE ?', "%#{params[:title]}%")
    end
    # ジャンル検索
    if params[:genre_id].present?
      @comics = @comics.where(genre_id: params[:genre_id])
    end
  end
  
  def show
    @comic = Comic.find(params[:id])
  end 
  
  def add_to_bookshelf
    @comic = Comic.find(params[:comic_id])
    if current_user.bookshelves.find_or_create_by(comic: @comic)
      flash[:notice] = "漫画を本棚に追加しました。"
    end
    redirect_to comics_path
  end

  def remove_from_bookshelf
    @comic = Comic.find(params[:comic_id])
    if (bookshelf = current_user.bookshelves.find_by(comic: @comic))
      bookshelf.destroy
      flash[:notice] = '漫画を本棚から削除しました。'
    end
    redirect_back fallback_location: comics_path
  end
  
end
