class PurposesController < ApplicationController

def new
    @purpose = Purpose.new
  end

  def create
    @purpose = Purpose.new(purpose_params)
    @purpose.user_id = current_user.id
    if @purpose.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private
  def purpose_params
    params.require(:purpose).permit(:purpose_score, :user_id)
  end
end
