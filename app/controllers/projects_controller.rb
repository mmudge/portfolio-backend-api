class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    projects = Project.all
    render json: projects
  end
end
