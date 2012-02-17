class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def new
    @title = "Create Project"
  end

end
