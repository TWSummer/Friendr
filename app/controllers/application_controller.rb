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
    rad_per_deg = Math::PI / 180
    rm = 3959

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map { |i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map { |i| i * rad_per_deg }

    a = Math.sin(dlat_rad / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    (rm * c).round
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
            if user1.question_friend_answers.any? { |friend_answer| friend_answer.question_option_id == other_answer.question_option_id }
              current_good_score += question_answer.importance
            end
            if user2.question_friend_answers.any? { |friend_answer| friend_answer.question_option_id == question_answer.question_option_id }
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
