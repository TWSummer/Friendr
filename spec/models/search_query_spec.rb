require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  describe("Associations") do
    it { should belong_to(:user) }
  end

  describe("Validations") do
    it "validates that min age is at least 18" do
      query = SearchQuery.new(min_age: 17)
      query.user = User.new
      expect(query).not_to be_valid

      query.min_age = 18
      expect(query).to be_valid
    end

    it "validates that max age is greater than min age" do
      query = SearchQuery.new(min_age: 50, max_age: 45)
      query.user = User.new
      expect(query).not_to be_valid

      query.max_age = 52
      expect(query).to be_valid
    end
  end
end
