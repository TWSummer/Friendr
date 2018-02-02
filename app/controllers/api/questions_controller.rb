class Api::QuestionsController < ApplicationController

  def index
    @question = Question.order(:id).limit(1)
      .offset(QuestionAnswer.where("user_id = #{current_user.id}").count)
      .includes(:question_options).first
    @answer_count = QuestionAnswer.where("user_id = #{current_user.id}").where("question_option_id >= 0").count
    render :index
  end

  def create

  end

end
