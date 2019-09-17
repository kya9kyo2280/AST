class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_studies_path
    else
      render :new
    end
  end

  private
  
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
