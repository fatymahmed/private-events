# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created successfully'
      redirect_to signin_path
    else
      flash.now[:danger] = 'User creation failed. Please enter valid information'
      render 'new'
    end
  end

  def login
    @user = User.find_by(email: params[:login][:email])
    sign_in_as(@user)
    flash[:success] = 'Successfully signed in'
    redirect_to user_path(@user)
  end

  def signin; end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @upcoming_events = @user.attended_events.upcoming
    @previous_events = @user.attended_events.past
  end

  def destroy
    log_out
    flash[:danger] = 'Successfully logged out'
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
