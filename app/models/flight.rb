class Flight < ApplicationRecord
  belongs_to :user

  default_scope -> { order(date: :desc) }

  validates :user_id, presence: true
  validates :date, presence: true
  validates :date, inclusion: {in: ->(date) { (Date.today-100.years...Date.today) }}
  validates :pic, presence: true
  # validates :day_hours,, :numericality => { :greater_than_or_equal_to => 0}
  # validates :night_hours,, :numericality => { :greater_than_or_equal_to => 0}
  # validates :sim_hours,, :numericality => { :greater_than_or_equal_to => 0}
  # validate :needs_min_hours
  validate :not_dual_if_pic

  def needs_min_hours
    # add more types of hours together as they get added
    if day_hours.to_i + night_hours.to_i + sim_hours.to_i < 0.1
      errors.add(:base, "You havent added any hours.  It's not really a flight if you go for 0.0 hours, is it?")
    end
  end

  def not_dual_if_pic
    if is_dual && (pic == 'self' || pic == 'Self')
      errors.add(:is_dual, "flight can't be dual if you're the Pilot of Command")
    end
  end

  def dual_if_sic
    if !is_dual && (sic == 'self' || sic == 'Self')
      errors.add(:is_dual, "You can't be the Co-pilot/Second-in-Command/Student if the flight isn't dual")
    end
  end

  def single_engine_day_pic
    if !is_dual && is_single_engine && !day_hours.nil?
      if day_hours > 0.0
        return day_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def single_engine_day_dual
    if is_dual && is_single_engine && !day_hours.nil?
      if day_hours > 0.0
        return day_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def single_engine_night_pic
    if !is_dual && is_single_engine && !night_hours.nil?
      if night_hours > 0.0
        return night_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def single_engine_night_dual
    if is_dual && is_single_engine && !night_hours.nil?
      if night_hours > 0.0
        return night_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def multi_engine_day_pic
    if !is_dual && !is_single_engine && !day_hours.nil?
      if day_hours > 0.0
        return day_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def multi_engine_day_dual
    if is_dual && !is_single_engine && !day_hours.nil?
      if day_hours > 0.0
        return day_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def multi_engine_night_pic
    if !is_dual && !is_single_engine && !night_hours.nil?
      if night_hours > 0.0
        return night_hours
      else
        return ''
      end
    else
      return ''
    end
  end

  def multi_engine_night_dual
    if is_dual && !is_single_engine && !night_hours.nil?
      if night_hours > 0.0
        return night_hours
      else
        return ''
      end
    else
      return ''
    end
  end

end
