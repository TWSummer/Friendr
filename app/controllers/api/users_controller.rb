class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(
        name: @user.username,
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say")
    if @user.save
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def fetch_user
    username = params[:username]
    username = current_user.username if username == "undefined"
    @user = User.find_by(username: username)
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
