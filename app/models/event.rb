class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :attendences, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendences
end
