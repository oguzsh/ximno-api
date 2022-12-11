class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index edit update destroy following followers]
  before_action :set_user

  def followings
    render json: @user.following
  end

  def followers
    render json: @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
