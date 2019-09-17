class PurposesController < ApplicationController
    before_action :authenticate_user!
def new
    @purpose = Purpose.new
    @score = Score.new
  end

  def create

    purpose = Purpose.new
    purpose.purpose_score = params[:purpose_score]
    purpose.user_id = current_user.id
    purpose.save
    @score = Score.new
    @score.current_score = params[:current_score]
    @score.user_id = current_user.id
    @score.save

    redirect_to user_path(current_user.id)

  end

  private
  
  def purpose_params
    params.require(:purpose).permit(:purpose_score, :user_id)
  end
end
