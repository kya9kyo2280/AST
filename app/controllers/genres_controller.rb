class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_study_path
    else
      render :new
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
