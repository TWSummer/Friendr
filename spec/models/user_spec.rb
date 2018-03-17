require 'rails_helper'

RSpec.describe User, type: :model do
  default_profile = Profile.new(
      name: "George",
      birthdate: Date.today - 18.years,
      gender: "Prefer Not to Say",
      primary_img_url: "https://i.imgur.com/KD3v2vP.jpg")

  it 'validates that password is at least 6 characters long' do
    invalid_user = User.new(username: 'User1', password: 'abcde')
    valid_user = User.new(username: 'User2', password: 'abcdef')
    invalid_user.profile = default_profile
    valid_user.profile = default_profile

    expect(invalid_user).not_to be_valid
    expect(valid_user).to be_valid
  end

  describe("Associations") do

    it { should have_one(:profile) }
    it { should have_many(:sent_messages) }
    it { should have_many(:received_messages) }
    it { should have_many(:question_answers) }
    it { should have_many(:question_friend_answers) }
  end
end
