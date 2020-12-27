class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    projects = Project.all

    render json: projects
  end

  def show
    project = Project.find(params[:id])
    render json: project
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project, status: :created
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def update
    project = Project.find(params[:id])
    project.assign_attributes(project_params)

    if project.save
      render json: project
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy
      render json: { message: 'Project destroyed'}
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end


  private
  def project_params
    params.require(:project).permit(:title, :description, :link, :github_link, :published)
  end
end
