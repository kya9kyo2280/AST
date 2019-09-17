class MediaController < ApplicationController
  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
    if @medium.save
      redirect_to new_study_path
    else
      render :new
    end
  end

  private
  
  def medium_params
    params.require(:medium).permit(:medium_name)
  end
end
