require 'spec_helper'

describe Issue do
  before :each do
    @project = Factory(:project)
    @attr    = { :title => "Major Bug", :content => "Something important doesn't seem to work",
                 :status => "new", :priority => 1 }
  end

  it "should create a new instance given valid attributes" do
    @project.issues.create! @attr
  end

  describe "project associations" do
    before :each do
      @issues = @project.issues.create @attr
    end

    it "should have a project attribute" do
      @issues.should respond_to(:project)
    end

    it "should have the righ associated project" do
      @issues.project_id.should == @project.id
      @issues.project.should == @project
    end
  end
end
