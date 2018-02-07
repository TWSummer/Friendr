class Api::ProfilesController < ApplicationController

  def update
    @profile = Profile.find_by(id: params[:id])
    if current_user && current_user.profile == @profile
      if @profile.update(profile_params)
        render :show
      else
        render json: @profile.errors.full_messages, status: 422
      end
    else
      render json: ["You must be logged in as this user to update their profile"], status: 401
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :name,
      :birthdate,
      :gender,
      :latitude,
      :longitude,
      :about_me,
      :looking_for,
      :primary_img_url)
  end
end
