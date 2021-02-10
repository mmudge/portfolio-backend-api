require 'pexels'

class PexelPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    amount = 1
    if params[:amount].present?
      amount = params[:amount]
    end

    photos = Pexels.get_photos(amount)

    if photos
      render json: photos
    else
      render json: { error: 'no photos'}
    end
  end
end
