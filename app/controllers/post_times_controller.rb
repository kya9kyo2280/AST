class PostTimesController < ApplicationController
  def new
     @post_time = PostTime.new
  end

  def create
    @post_time = PostTime.new(post_time_params)
    @post_time.user_id = current_user.id
    if @post_time.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private
  def post_time_params
    params.require(:post_time).permit(:study_time, :user_id)
  end
end
