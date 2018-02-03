class Api::QuestionsController < ApplicationController

  def index
    @question = Question.order(:id).limit(1)
      .offset(QuestionAnswer.where("user_id = #{current_user.id}").count)
      .includes(:question_options).first
    @answer_count = QuestionAnswer.where("user_id = #{current_user.id}").where("question_option_id >= 0").count
    render :index
  end

  def create
    if check_for_missing_params.empty?
      @question_answer = create_question_answer
      @question_friend_answers = []
      params[:friendAnswer].each do |option|
        friend_answer = QuestionFriendAnswer.new({question_option_id: option})
        friend_answer.question_answer = @question_answer
        @question_friend_answers.push(friend_answer)
      end
      @question_answer.question_friend_answers = @question_friend_answers
      if @question_answer.save
        @question = Question.order(:id).limit(1)
          .offset(QuestionAnswer.where("user_id = #{current_user.id}").count)
          .includes(:question_options).first
        @answer_count = QuestionAnswer.where("user_id = #{current_user.id}").where("question_option_id >= 0").count
        render :index
      else
        render json: @question_answer.errors.full_messages, status: 422
      end
    else
      render json: check_for_missing_params, status: 422
    end
  end

  private

  def create_question_answer
    QuestionAnswer.new(
      question_id: params[:id],
      user_id: current_user.id,
      question_option_id: params[:myAnswer],
      importance: params[:importance]
    )
  end

  def check_for_missing_params
    error_messages = []
    unless params[:id]
      error_messages.push("Question id is missing - Refresh page")
    end
    unless params[:myAnswer]
      error_messages.push("You must select your answer")
    end
    unless params[:friendAnswer]
      error_messages.push("You must select a response you will accept from a friend")
    end
    unless params[:importance]
      error_messages.push("You must choose the importance")
    end
    error_messages
  end

end
