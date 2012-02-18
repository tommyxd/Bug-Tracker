require 'spec_helper'

describe Project do
  before :each do
    @attr = { :title => "Example Project" }
  end

  it "should create a project given with valid title" do
    Project.create! @attr
  end

  it "should require a title" do
    no_name_project = Project.new @attr.merge(:title => "")
    no_name_project.should_not be_valid
  end

  it "should reject too long project names" do
    long_name = 'project' * 10
    long_name_project = Project.new @attr.merge(:title => long_name)
    long_name_project.should_not be_valid
  end

  describe "issues association" do
    before :each do
      @project = Project.create @attr
    end

    it "should have an issues attribute" do
      @project.should respond_to(:issues)
    end
  end
end
