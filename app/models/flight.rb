class Flight < ApplicationRecord
  belongs_to :user

  default_scope -> { order(date: :desc) }

  validates :user_id, presence: true
  validates :date, presence: true
  validates :date, inclusion: {in: ->(date) { (Date.today-100.years...Date.today) }}
  validates :pic, presence: true
  validate :needs_min_hours

  def needs_min_hours
    # add more types of hours together as they get added
    if day_hours < 0.1
      errors.add(:base, "You havent added any hours.  It's not really a flight if you go for 0.0 hours, is it?")
    end
  end

end
