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
    
  end
end
