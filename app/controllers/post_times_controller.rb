class PostTimesController < ApplicationController
  def new
     @post_time = PostTime.new
  end

  def create
    if current_user.post_times.find_by(study_day: date_format).present?
      @post_time = current_user.post_times.find_by(study_day: date_format)
      @post_time.study_time += params[:post_time][:study_time].to_f
    else
      @post_time = PostTime.new(post_time_params)
      @post_time.user_id = current_user.id
    end

    if @post_time.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @post_time = PostTime.find(params[:id])
    @post_time.destroy
    redirect_to user_path(current_user.id)
    end

  private
  def post_time_params
    params.require(:post_time).permit(:study_time, :study_day, :user_id)
  end

  def date_format
    Date.new(params[:post_time][:"study_day(1i)"].to_i, params[:post_time][:"study_day(2i)"].to_i, params[:post_time][:"study_day(3i)"].to_i,)
  end
end
