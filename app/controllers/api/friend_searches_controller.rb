class Api::FriendSearchesController < ApplicationController

  def index
    @search_query = current_user.search_query
    @search_result = User.all
    @cur_user = User.all
                   .includes(:profile)
                   .includes(question_answers: :question_friend_answers)
                   .where("id = #{current_user.id}").first
    add_search_criteria

    render :index
  end

  def update
    @search_query = current_user.search_query
    if current_user && current_user.search_query == @search_query
      if @search_query.update(search_params)
        @search_result = User.all
        @cur_user = User.all
                       .includes(:profile)
                       .includes(question_answers: :question_friend_answers)
                       .where("id = #{current_user.id}").first
        add_search_criteria

        render :index
      else
        render json: @search_query.errors.full_messages, status: 422
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:min_age, :max_age, :max_distance, :active_within)
  end

  def add_search_criteria
    @search_result = @search_result
                    .includes(:profile)
                    .includes(question_answers: :question_friend_answers)
                    .where("users.id != #{current_user.id}")
                    .where("users.demo IS NULL")
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
      dist = distance(loc1, loc2)
      !dist.nil? && dist <= @search_query.max_distance
    end
  end

end
