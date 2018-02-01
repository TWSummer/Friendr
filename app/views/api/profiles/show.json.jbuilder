json.extract! @profile, :id, :user_id, :name, :gender, :about_me, :looking_for, :primary_img_url, :birthdate, :latitude, :longitude
json.age ((Time.now - @profile.birthdate.to_time) / 1.year).to_i
