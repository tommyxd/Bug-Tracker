class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @title   = @project.title
  end

  def new
    @project = Project.new
    @title   = "Create Project"
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to @project
    else
      @title = "Create Project"
      render 'new'
    end
  end
end
