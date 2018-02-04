class QuestionAnswer < ApplicationRecord
  validates :importance, :question_option_id, presence: true
  validate :not_all_options, :appropriate_importance

  belongs_to :question
  belongs_to :user
  belongs_to :question_option, optional: true
  has_many :question_friend_answers, dependent: :destroy

  def not_all_options
    if question_friend_answers.length == question.question_options.length
      errors.add(:question_friend_answers, "should be 'Any of the above' if you will accept any answer")
    end
  end

  def appropriate_importance
    if question_friend_answers.first &&
       question_friend_answers.first.question_option_id != -1 &&
       importance == 0
      errors.add(:importance, "must be selected")
    end
  end
end
