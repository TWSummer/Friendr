require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should validate_presence_of(:name) }
  it do
    should validate_length_of(:name).
      is_at_most(24).
      on(:create)
  end
  it { should validate_presence_of(:birthdate) }
  it { should validate_presence_of(:gender) }
  it { should validate_inclusion_of(:gender).in_array(["Male", "Female", "Other", "Prefer Not to Say"])}
end
