# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.create(name: 'example', email: 'example@user.com')
    @event = @user.events.new(description: 'Microverse assembly', date: Date.today, location: 'zoom')
  end
  context 'valid Event' do
    it 'with a valid description,date and location' do
      expect(@event).to be_valid
    end
    it 'with a valid user' do
      expect(@event).to be_valid
    end
  end

  context 'invalid Event' do
    it 'with an invalid description,date and location' do
      @event.description = @event.date = @event.location = ' '
      expect(@event).to_not be_valid
      expect(@event.errors.count).to eql(3)
    end
    it 'with an invalid user' do
      another_user = User.create(name: ' ', email: 'example@user.com')
      another_event = another_user.events.new(description: 'Microverse assembly', date: Date.today, location: 'zoom')
      expect(another_event).to_not be_valid
    end
  end
end
