class UsersController < ApplicationController
include SessionsHelper

  def log_in
  end


  def sign_up
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to '/users'
  end
  def profile
    @user=current_user
    @day=Day.new
    @days=Day.all
    # @days.each do |day|
    #   puts @days.to_json
    #   puts 'x'*300
    #   puts day.to_json
    #   puts day.day_number
    #   puts day.date
    #   puts 'x'*300
    # end
  end

  # def day_create
  #   puts 'x'*300
  #   puts day_params
  #   puts 'x'*300
  #   day= Day.create(day_params)
  #   redirect_to '/users/profile'
  # end

  def destroy
    user = User.find(params[:id])
    user.delete()
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  # def day_params
  #   params.require(:day).permit(:date, :day_number)
  # end
end
