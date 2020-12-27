class PagesController < ApplicationController
  def index
    render json: { status: 'ok', environment: Rails.env }
  end
end
