class Api::QuestionsController < ApplicationController

  def index
    @question = Question.order(:id).limit(1)
      .offset(QuestionAnswer.where("user_id = #{current_user.id}").count)
      .includes(:question_options).first
    render :index
  end

  def create

  end

end
