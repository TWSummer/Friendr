class QuestionFriendAnswer < ApplicationRecord
  validates :question_option_id, presence: true

  belongs_to :question_answer
  belongs_to :question_option, optional: true
end
