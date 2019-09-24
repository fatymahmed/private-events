# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before :each do
    @user = User.create(name: 'example', email: 'example@user.com')
    @event = @user.events.create(description: 'Microverse assembly', date: Date.today, location: 'zoom')
    @attendance=Attendance.new(attendee: @user,attended_event: @event)
  end
  context 'valid Attendance' do
    it 'with a valid user' do
      expect(@attendance).to be_valid
    end
    it 'with a valid event' do
      expect(@attendance).to be_valid
    end
  end
end
  