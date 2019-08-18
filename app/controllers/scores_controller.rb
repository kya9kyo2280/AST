class ScoresController < ApplicationController

def new
    @score = Score.new
    
  end

  def create
    @score = Score.new(score_params)
    @score.user_id = current_user.id
    if @score.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private
  def score_params
    params.require(:score).permit(:current_score, :user_id)
  end


end
