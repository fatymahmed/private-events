class Event < ApplicationRecord
	belongs_to :user, :class_name => "User", :foreign_key => 'creator_id'
	validates :description, presence: true, length: {maximum: 200}
	validates_presence_of :date
	validates :location, presence: true, length: {maximum: 100}
end

