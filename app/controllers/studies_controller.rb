class StudiesController < ApplicationController
  def show
    @study = Study.find(params[:id])
  end

  def index
    @studies = Study.all
    @search = Study.ransack(params[:q])
    @studies = @search.result
  end

  def new
    @study = Study.new
  end

  def create
    @study = Study.new(study_params)
    @study.user_id = current_user.id
    @study.save
    redirect_to root_path
  end

  def edit
     @study = Study.find(params[:id])
  end

  def update
    study = Study.find(params[:id])
    study.update(study_params)
    redirect_to study_path(study.id)
  end

  def destroy
    study = Study.find(params[:id])
    study.destroy
    redirect_to root_path
  end

  private
    def study_params
        params.require(:study).permit(:study_title, :review, :image, :user_id, :genre_id, :medium_id)
    end
end
