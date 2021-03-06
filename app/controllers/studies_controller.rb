class StudiesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @study = Study.find(params[:id])
    @like = Like.new
    @study_comments = @study.study_comments
    @study_comment = StudyComment.new
  end

  def index
    @studies = Study.page(params[:page]).per(6).order(id: "DESC")
    @search = Study.ransack(params[:q])
    @studies = @search.result.page(params[:page]).per(6).order(id: "DESC")
    @all_ranks = Study.find(Like.group(:study_id).order('count(study_id) desc').limit(5).pluck(:study_id))
    @like = Like.new
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

  def correct_user
  @study = Study.find(params[:id])
  if current_user.id != @study.user_id
    redirect_to root_path
  end
end

  def about
  end

  private
    def study_params
        params.require(:study).permit(:study_title, :review, :image, :user_id, :genre_id, :medium_id)
    end
end
