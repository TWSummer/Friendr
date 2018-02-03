class QuestionAnswer < ApplicationRecord
  validates :importance, :question_option_id, presence: true

  belongs_to :question
  belongs_to :user
  belongs_to :question_option, optional: true
  has_many :question_friend_answers, dependent: :destroy
end
