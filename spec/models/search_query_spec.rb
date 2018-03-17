require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  describe("Associations") do
    it { should belong_to(:user) }
  end
end
