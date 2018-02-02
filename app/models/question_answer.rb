class QuestionAnswer < ApplicationRecord
  validates :importance, presence: true

  belongs_to :question
  belongs_to :user
  belongs_to :question_option
  has_many :question_friend_answers, dependent: :destroy
end
