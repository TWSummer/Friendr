class SearchQuery < ApplicationRecord
  validate :age_range, :positive_distance, :positive_active_within

  belongs_to :user

  def age_range
    if min_age && min_age < 18
      errors.add(:min_age, "must be at least 18")
    end
    if max_age && max_age < min_age
      errors.add(:max_age, "must be greater than minimum age")
    end
  end

  def positive_distance
    if max_distance && max_distance <= 0
      errors.add(:max_distance, "must be a positive number")
    end
  end

  def positive_active_within
    if active_within && active_within <= 0
      errors.add(:active_within, "must be a positive number")
    end
  end
end
