class UsersController < ApplicationController
     before_action :authenticate_user!

  def show
        @user = User.find(params[:id])
        @purpose = Purpose.new
        @score = Score.new
        @post_time = PostTime.new
        @totalstudytime =  @user.post_times.all.sum(:study_time)
                            respond_to do |format|
                            format.html
                            format.json {render:json => @totalstudytime}
                            format.js
                            end

        @usertime =  @user.usertime
                     respond_to do |format|
                     format.html
                     format.json {render:json => @usertime}
                     format.js
                     end

        @purposetime =  @user.purposetime
                     respond_to do |format|
                     format.html
                     format.json {render:json => @purposetime}
                     format.js
                     end
        @post_times = @user.post_times.order(study_day: "DESC").page(params[:page]).per(6)
        @graphtimes =  @user.post_times.order(study_day: "DESC").limit(6).reverse
        @timeline = Array.new
        @graphtimes.each do |graphtime|
            @timeline.push(graphtime.study_time)
        end
        @graphdays =  @user.post_times.order(study_day: "DESC").limit(6).reverse
        @dayline = Array.new
        @graphdays.each do |graphday|
            @dayline.push(graphday.study_day.strftime('%m/%d').to_s)
        end

    end

    def index
         user_time_count = User.all.joins(:post_times).where(post_times:{ study_day:1.weeks.ago..Time.now}).group(:user_id).sum(:study_time)
         user_time_ids = Hash[user_time_count.sort_by{ |_, v| -v }].keys
         @user_ranking= User.find(user_time_ids).sort_by{ |o| user_time_ids.index(o.id)}
         @users = User.all
    end

    def edit
        @user = User.find(params[:id])
        if @user.id != current_user.id
            redirect_to user_path(@current_user.id)
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(user.id)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path

    end

  private

    def user_params
        params.require(:user).permit(:name,:profile_image)
    end

end
