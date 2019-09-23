class EventsController < ApplicationController
  before_action :logged_in
  def new
    @event=Event.new()
  end

  def create
    @event=current_user.events.build(events_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event=Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:description, :date, :location)
  end

  def logged_in
    if current_user.nil?
      redirect_to new_user_path
    end
  end
end
