require 'spec_helper'

describe User do
  before :each do
    @attr = { :name  => "Tomislav Dyulgerov",
              :email => "tommy@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create! @attr
  end

  it "should require a name" do
    no_name_user = User.new @attr.merge(:name => "")
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new @attr.merge(:email => "")
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = 'a' * 51
    long_name_user = User.new @attr.merge(:name => long_name)
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    valid_addresses = %w[example@example.com user@example.org USER@gmail.com]
    valid_addresses.each do |valid_email|
      valid_email_user = User.new @attr.merge(:email => valid_email)
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    invalid_addresses = %w[user@example,org invalid_email_at_gmail.com someone@yahoo]
    invalid_addresses.each do |invalid_email|
      invalid_email_user = User.new @attr.merge(:email => invalid_email)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject email addresses identical when uppercase" do
    upcased_email = @attr[:email].upcase
    User.create! @attr.merge(:email => upcased_email)
    user_with_identical_email = User.new @attr
    user_with_identical_email.should_not be_valid
  end
end
