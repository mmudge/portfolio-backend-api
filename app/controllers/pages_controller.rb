class PagesController < ApplicationController
  def index
    render json: { status: 'ok', env: Rails.env }
  end
end
