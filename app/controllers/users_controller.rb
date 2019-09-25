# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_as(@user)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end
  
  def destroy
    log_out
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
