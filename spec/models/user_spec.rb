require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates that password is at least 6 characters long' do
    invalid_user = User.new(username: 'User1', password: 'abcde')
    valid_user = User.new(username: 'User2', password: 'abcdef')
    invalid_user.profile = Profile.new(
        name: invalid_user.username[0..23],
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say",
        primary_img_url: "https://i.imgur.com/KD3v2vP.jpg")

    valid_user.profile = Profile.new(
        name: valid_user.username[0..23],
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say",
        primary_img_url: "https://i.imgur.com/KD3v2vP.jpg")

    expect(invalid_user).not_to be_valid
    expect(valid_user).to be_valid
  end
end
