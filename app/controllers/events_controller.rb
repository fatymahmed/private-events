# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    event = Event.find(params[:id])
    attendance = Attendance.new(attendee: current_user, attended_event: event)
    if attendance.save
      redirect_to current_user
    else
      render 'index'
    end
  end

  private

  def events_params
    params.require(:event).permit(:description, :date, :location)
  end

  def logged_in
    redirect_to new_user_path if current_user.nil?
  end
end
