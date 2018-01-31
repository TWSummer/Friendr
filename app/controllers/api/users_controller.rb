class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(
        name: @user.username,
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say")
    if @user.save
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def fetch_user
    @user = User.find_by(username: params[:username])
    if @user
      @profile = @user.profile
      render "api/profiles/show"
    else
      render json: ["Unable to locate this user"], status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
