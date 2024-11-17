class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @params = params[:id]
    @comics = Comic.page(params[:page]).per(10)
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
  
end
