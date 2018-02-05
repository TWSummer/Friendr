class Api::FriendSearchesController < ApplicationController

  def index
    @search_query = current_user.search_query
    @search_result = User.all.includes(:profile).joins(:profile).where("users.id != #{current_user.id}")
    add_search_criteria

    render :index
  end

  def update

  end

  private

  def add_search_criteria
    if @search_query.min_age
      @search_result = @search_result.where(profiles: {birthdate: Date.today - 200.years .. Date.today - @search_query.min_age.years})
    end
    if @search_query.max_age
      @search_result = @search_result.where(profiles: {birthdate: Date.today - @search_query.max_age.years .. Date.today - 18.years})
    end
    if @search_query.active_within
      @search_result = @search_result.where(users: {updated_at: Time.now - @search_query.active_within.days .. Time.now})
    end
    if @search_query.max_distance
      @search_result = @search_result.where.not(profiles: {latitude: nil})
      @search_result = @search_result.where.not(profiles: {longitude: nil})
      add_distance_criteria
    end
  end

  def add_distance_criteria
    loc1 = [current_user.profile.latitude, current_user.profile.longitude]
    @search_result = @search_result.select do |result|
      loc2 = [result.profile.latitude, result.profile.longitude]
      distance(loc1, loc2) <= @search_query.max_distance
    end
  end

  def distance(loc1, loc2)
    rad_per_deg = Math::PI / 180
    rm = 3959

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map { |i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map { |i| i * rad_per_deg }

    a = Math.sin(dlat_rad / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    rm * c
end

end
