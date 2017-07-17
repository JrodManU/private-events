class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :attendences, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendences

  scope :previous, -> { Event.all.where('date <= ?', Time.zone.now.beginning_of_day).order(date: :DESC) }
  scope :upcoming, -> { Event.all.where('date > ?', Time.zone.now.beginning_of_day).order(:date) }
end
