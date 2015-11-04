class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
      @articles = @user.articles
  end

  private
    def set_user
      @user = User.friendly.find(params[:id])
    end
end