class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :attendences, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendences
  has_secure_password

  def is_attending?(event_id)
    attended_events.exists?(event_id)
  end

  def previous_events
    events.where('date <= ?', Time.zone.now.beginning_of_day).order(date: :DESC)
  end

  def upcoming_events
    events.where('date > ?', Time.zone.now.beginning_of_day).order(:date)
  end
end
