class Admin::BookshelvesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @bookshelves = Bookshelf.all.includes(:comics)
  end
  
  def show
    @bookshelf = Bookshelf.find(params[:id])
  end
  
end
