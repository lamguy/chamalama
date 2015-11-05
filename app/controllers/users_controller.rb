class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]
  def show
    @articles   = @user.articles      
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_id: @user, owner_type: "User")
  end

  def follow

    respond_to do |format|
      if current_user.follow(@user)
        format.html { redirect_to profile_path(@user), notice: "You are now following #{current_user.username}"  }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def unfollow

    respond_to do |format|
      if current_user.stop_following(@user)
        format.html { redirect_to profile_path(@user), notice: "You are not following #{current_user.username}"  }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.friendly.find(params[:id])
    end

end
