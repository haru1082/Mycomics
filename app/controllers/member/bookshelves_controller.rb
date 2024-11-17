class Member::BookshelvesController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookshelves = current_user.bookshelves.includes(:comic)
  end 
  
  def show
    @bookshelf = current_user.bookshelves.find(params[:id])
  end
  
  def destroy
    @bookshelf = current_user.bookshelves.find(params[:id])
    @bookshelf.destroy
    flash[:success] = "本棚から削除しました。"
    redirect_to bookshelves_path
  end 
  
end
