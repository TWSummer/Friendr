require 'rails_helper'

RSpec.describe Message, type: :model do
  describe("Associations") do
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end

  describe("Validations") do
    it { should validate_presence_of(:body) }
  end
end
