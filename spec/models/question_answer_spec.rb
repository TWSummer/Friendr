require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  describe "Associations" do
    it { should have_many(:question_friend_answers) }
    it { should belong_to(:question) }
    it { should belong_to(:user) }
    it { should belong_to(:question_option) }
  end

  describe("Validations") do
    
  end
end
