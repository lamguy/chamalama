class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
      @articles   = @user.articles      
      @activities = PublicActivity::Activity.order("created_at DESC").where(owner_id: current_user, owner_type: "User")
  end

  private
    def set_user
      @user = User.friendly.find(params[:id])
    end

end
