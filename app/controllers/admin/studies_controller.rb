class Admin::StudiesController < ApplicationController
  before_action :authenticate_admin!
	def show
    @study = Study.find(params[:id])
    @study_comments = @study.study_comments
  end

  def index
    @studies = Study.all
  end

  def destroy
    study = Study.find(params[:id])
    study.destroy
    redirect_to admin_studies_path
  end

  private
    def study_params
        params.require(:study).permit(:study_title, :review)
    end

end

