class Member::ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
    #@comic = @comics.page(params[:page]).per(10)
  end 
  
  def show
    @comic = Comics.find(params[:id])
  end 
  
  def create
  end 
  
  
end
