class StudyCommentsController < ApplicationController

def create
	study = Study.find(params[:study_id])
    @study_comment = StudyComment.new(study_comment_params)
    @study_comment.user_id = current_user.id
    @study_comment.study_id = study.id
    if @study_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    study = Study.find(params[:study_id])
    @study_comment = study.study_comments.find(params[:id])
    @study_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  
  def study_comment_params
    params.require(:study_comment).permit(:comment, :user_id, :study_id)
  end
end

