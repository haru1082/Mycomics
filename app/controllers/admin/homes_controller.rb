class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @params = params[:id]
    @comics = Comic.page(params[:page]).per(10)
  end
  
end
