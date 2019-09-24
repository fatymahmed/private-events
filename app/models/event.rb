class Event < ApplicationRecord
	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	has_many :attendances, foreign_key: 'attended_event_id'
	has_many :attendees, :through => :attendances, :class_name => "User"


	validates :description, presence: true, length: {maximum: 200}
	validates_presence_of :date
	validates :location, presence: true, length: {maximum: 100}
end


