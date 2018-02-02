class QuestionOption < ApplicationRecord
  validates :body, presence: true

  belongs_to :question
  has_many :question_answers
  has_many :question_friend_answers
end
