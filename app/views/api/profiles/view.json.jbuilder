json.extract! @profile, :id, :user_id, :name, :gender, :about_me, :looking_for,
              :primary_img_url, :birthdate, :latitude, :longitude, :age
json.compatibility (calculate_match_percentage(@cur_user, @user)* 100).round(1)
json.distance distance([@cur_user.profile.latitude, @cur_user.profile.longitude],
                       [@user.profile.latitude, @user.profile.longitude])
