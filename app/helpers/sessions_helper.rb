module SessionsHelper
  def current_user
    if session[:user_id]
      puts session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def profile
    @user=current_user
    @days = Day.all
    @day = Day.new
  end

  def authenticate!
    redirect_to '/users' unless current_user
  end



end
