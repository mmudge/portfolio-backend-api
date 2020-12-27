class TechnologiesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    technologies = Technology.all
    render json: technologies
  end

  def create
    technology = Technology.new(technology_params)

    if technology.save
      render json: technology, status: :created
    else
      render json: technology.errors, status: :unprocessable_entity
    end
  end

  def update
    technology = Technology.find(params[:id])
    technology.assign_attributes(technology_params)

    if technology.save
      render json: technology
    else
      render json: technology.errors, status: :unprocessable_entity
    end
  end

  def destroy
    technology = Technology.find(params[:id])
    if technology.destroy
      render json: { message: 'Technology destroyed'}
    else
      render json: technology.errors, status: :unprocessable_entity
    end
  end

  private
  def technology_params
    params.require(:technology).permit(:name, :icon, :color)
  end
end
