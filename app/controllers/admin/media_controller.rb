class Admin::MediaController < ApplicationController
  before_action :authenticate_admin!
  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
    if @medium.save
      redirect_to admin_studies_path
    else
      render :new
    end
  end

  private
  
  def medium_params
    params.require(:medium).permit(:medium_name)
  end
end
