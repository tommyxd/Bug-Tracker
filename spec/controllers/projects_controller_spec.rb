require 'spec_helper'

describe ProjectsController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Create Project")
    end
  end

  describe "GET 'show'" do
    before :each do
      @project = Factory(:project)
    end

    it "should be success" do
      get :show, :id => @project
      response.should be_success
    end
    
    it "should find the right project" do
      get :show, :id => @project
      assigns(:project).should == @project
    end

    it "should have the right title" do
      get :show, :id => @project
      response.should have_selector("title", :content => @project.title)
    end

    it "should include the project's title" do
      get :show, :id => @project
      response.should have_selector("h1", :content => @project.title)
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before :each do
        @attr = { :title => "" }
      end

      it "should not create a new project" do
        lambda do
          post :create, :project => @attr
        end.should_not change(Project, :count)
      end
    end

    describe "success" do
      before :each do
        @attr = { :title => "Example Project" }
      end

      it "should create a new project" do
        lambda do
          post :create, :project => @attr
        end.should change(Project, :count).by(1)
      end
    end
  end
end
