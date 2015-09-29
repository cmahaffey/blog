class DaysController < ApplicationController


  def index

    @date=1
    @days=Day.all

  end

  def show
    @day=Day.where("day_number = ?", params[:day_number]).first
  end

  def update
  end

  def create
    day=Day.create(day_params)
    redirect_to '/users/profile'
  end

  def destroy
    Day.delete(params[:id])
    redirect_to '/users/profile'
  end

  private

  def day_params
    params.require(:day).permit( :day_number)
  end



end
