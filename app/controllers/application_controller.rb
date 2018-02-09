class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :calculate_match_percentage, :distance

  def current_user
    before = !!@current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    if !before && @current_user
      if @current_user.activity_count.nil?
        @current_user.activity_count = 1
      else
        @current_user.activity_count += 1
      end
      @current_user.save
    end
    @current_user
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout()
    if current_user
      if current_user.demo
        current_user.destroy
      else
        current_user.reset_session_token!
      end
    end
    session.delete(:session_token)
  end

  def distance(loc1, loc2)
    return nil if loc1[0].nil? || loc1[1].nil? || loc2[0].nil? || loc2[1].nil?
    radians_per_degree = Math::PI / 180
    earth_radius_miles = 3959

    latitude_difference = (loc2[0] - loc1[0]) * radians_per_degree
    longitude_difference = (loc2[1] - loc1[1]) * radians_per_degree

    lat1_rad, lon1_rad = loc1.map { |i| i * radians_per_degree }
    lat2_rad, lon2_rad = loc2.map { |i| i * radians_per_degree }

    a = Math.sin(latitude_difference / 2)**2 + Math.cos(lat1_rad) *
        Math.cos(lat2_rad) * Math.sin(longitude_difference/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    (earth_radius_miles * c).round
  end

  def calculate_match_percentage(user1, user2)
    total_similar_questions, current_total_score, current_good_score = 0, 0, 0
    other_total_score, other_good_score = 0, 0

    user1.question_answers.each do |question_answer|
      if question_answer.question_option_id >= 0
        user2.question_answers.each do |other_answer|
          if other_answer.question_id == question_answer.question_id &&
             other_answer.question_option_id >= 0

            total_similar_questions += 1
            current_total_score += question_answer.importance
            other_total_score += other_answer.importance
            if question_answer.question_friend_answers.any? { |friend_answer| friend_answer.question_option_id == other_answer.question_option_id }
              current_good_score += question_answer.importance
            end
            if other_answer.question_friend_answers.any? { |friend_answer| friend_answer.question_option_id == question_answer.question_option_id }
              other_good_score += other_answer.importance
            end
          end
        end
      end
    end
    return 0 if total_similar_questions == 0
    if current_total_score == 0
      i_rate_them = 0
    else
      i_rate_them = (current_good_score / current_total_score.to_f)
    end
    if other_total_score == 0
      they_rate_me = 0
    else
      they_rate_me = (other_good_score / other_total_score.to_f)
    end
    if (i_rate_them + they_rate_me) / 2 - (1 / total_similar_questions.to_f) < 0
      return 0
    else
      return (i_rate_them + they_rate_me) / 2 - (1 / total_similar_questions.to_f)
    end
  end
end
