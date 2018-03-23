require 'rails_helper'

RSpec.describe Question, type: :model do
  describe("Associations") do
    it { should have_many(:question_options) }
    it { should have_many(:question_answers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:question) }
  end
end
