class IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @title = "New Issue"
  end

  def show
    @issue = Issue.find(params[:id])
    @title = @issue.title
  end

  def create
    @issue = Issue.new(params[:issue])
    if @issue.save
      flash[:success] = "A new issue has been reported."
      redirect_to @issue
    else
      @title = "New Issue"
      render 'new'
    end
  end

  def edit
    @issue = Issue.find(params[:id])
    @title = "Edit"
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(params[:issue])
      flash[:success] = "The issue has been updated."
      redirect_to @issue
    else
      @title = "Edit"
      render 'edit'
    end
  end

  def index
    
  end
end
