# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id

  has_many :user_events
  has_many :attendees, through: :user_events, source: 'user'

  scope :upcoming_events, -> { where('date > ?', Date.today) }
  scope :prev_events, -> { where('date < ?', Date.today) }
end
