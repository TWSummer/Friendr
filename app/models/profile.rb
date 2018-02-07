class Profile < ApplicationRecord
  validates :user, :name, :birthdate, :gender, presence: true
  validates :user, uniqueness: true
  validates :name, length: { maximum: 24 }
  validates :gender, inclusion: { in: ["Male", "Female", "Other", "Prefer Not to Say"]}
  validates :latitude, :longitude, numericality: true, allow_nil: true
  validate :birthdate_appropriate

  belongs_to :user

  def birthdate_appropriate
    if birthdate
      if birthdate > Date.today - 18.years
        errors.add(:birthdate, "must be at least 18 years ago")
      end
      if birthdate < Date.today - 118.years
        errors.add(:birthdate, "is too long ago")
      end
    end
  end

  def age
    ((Time.now - birthdate.to_time) / 1.year).to_i
  end


end
