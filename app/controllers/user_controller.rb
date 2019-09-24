class UserController < ApplicationController
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
    @attended_events = @user.attended_events
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
