class Question < ApplicationRecord
  validates :question, presence: true

  has_many :question_options, dependent: :destroy
  has_many :question_answers, dependent: :destroy
end
