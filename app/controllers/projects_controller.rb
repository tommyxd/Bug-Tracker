class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @issues  = @project.issues.paginate(:page => params[:page])
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

  def edit
    @project = Project.find(params[:id])
    @title   = "Edit project"
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project updated."
      redirect_to @project
    else
      @title = "Edit project"
      render 'edit'
    end
  end

  def index
    @title    = "All projects"
    @projects = Project.paginate(:page => params[:page])
  end
end
