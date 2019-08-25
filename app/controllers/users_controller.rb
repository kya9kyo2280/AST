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
        @usertime =  if @user.scores.last.current_score < 201
                        0
                     elsif @user.scores.last.current_score < 251
                        200
                     elsif @user.scores.last.current_score < 301
                        400
                     elsif @user.scores.last.current_score < 351
                        600
                     elsif @user.scores.last.current_score < 401
                        800
                     elsif @user.scores.last.current_score < 451
                        950
                     elsif @user.scores.last.current_score < 501
                        1100
                     elsif @user.scores.last.current_score < 551
                        1250
                     elsif @user.scores.last.current_score < 601
                        1400
                     elsif @user.scores.last.current_score < 651
                        1550
                     elsif @user.scores.last.current_score < 701
                        1700
                     elsif @user.scores.last.current_score < 751
                        2000
                     elsif @user.scores.last.current_score < 801
                        2300
                     elsif @user.scores.last.current_score < 851
                        2600
                     elsif @user.scores.last.current_score < 901
                        2900
                     elsif @user.scores.last.current_score < 951
                        3400
                     else
                        3900
                     end

                     respond_to do |format|
                     format.html
                     format.json {render:json => @usertime}
                     format.js
                     end

        @purposetime = if @user.purposes.last.purpose_score < 201
                        0
                    elsif@user.purposes.last.purpose_score < 251
                        200
                     elsif @user.purposes.last.purpose_score < 301
                        400
                     elsif @user.purposes.last.purpose_score < 351
                        600
                     elsif @user.purposes.last.purpose_score < 401
                        800
                     elsif @user.purposes.last.purpose_score < 451
                        950
                     elsif @user.purposes.last.purpose_score < 501
                        1100
                     elsif @user.purposes.last.purpose_score < 551
                        1250
                     elsif @user.purposes.last.purpose_score < 601
                        1400
                     elsif @user.purposes.last.purpose_score < 651
                        1550
                     elsif @user.purposes.last.purpose_score < 701
                        1700
                     elsif @user.purposes.last.purpose_score < 751
                        2000
                     elsif @user.purposes.last.purpose_score < 801
                        2300
                     elsif @user.purposes.last.purpose_score < 851
                        2600
                     elsif @user.purposes.last.purpose_score < 901
                        2900
                     elsif @user.purposes.last.purpose_score < 951
                        3400
                     else
                        3900
                     end
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
            @dayline.push(graphday.study_day.to_s)
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
