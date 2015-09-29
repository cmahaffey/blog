class PicturesController < ApplicationController

  def index
    render json: Picture.all
  end

  def new
    Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/users/profile'
  end

  def destroy
    Picture.delete(params[:id])
    redirect_to '/users/profile'
  end

  private
  def picture_params
    params.require(:picture).permit(:day_id, :img_url)
  end

end
