class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :attendences, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendences
  has_secure_password
end
