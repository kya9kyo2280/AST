class Admin::StudiesController < ApplicationController
	def show
    @study = Study.find(params[:id])
  end

  def index
    @studies = Study.all
  end

  def destroy
    study = Study.find(params[:id])
    study.destroy
    redirect_to root_path
  end

  private
    def study_params
        params.require(:study).permit(:study_title, :review)
    end

end

