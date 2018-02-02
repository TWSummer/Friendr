class QuestionFriendAnswer < ApplicationRecord
  belongs_to :question_answer
  belongs_to :question_option
end
