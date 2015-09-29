class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/users/profile'
    else
      redirect_to '/users'
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/users'
  end



end
