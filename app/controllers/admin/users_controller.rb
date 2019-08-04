class Admin::UsersController < ApplicationController

	 def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end


    def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
    end

  private

    def user_params
        params.require(:user).permit(:name)
    end
end
