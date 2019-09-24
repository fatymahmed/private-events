class User < ApplicationRecord
	has_many :events

	has_many :attendances, foreign_key: 'attendee_id'
	has_many :attended_events, through: :attendances, class_name: 'Event'

	before_save :downcase_email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 150 }
  validates :email, presence: true, length: { maximum: 150 },
                    uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

	private
	def downcase_email
		email.downcase!
	end
end

