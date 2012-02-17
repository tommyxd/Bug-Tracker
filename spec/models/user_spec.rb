require 'spec_helper'

describe User do
  before :each do
    @attr = { :name  => "Tomislav Dyulgerov",
              :email => "tommy@example.com",
              :password => "password",
              :password_confirmation => "password" }
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

  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end

    it "should reject short passwords" do
      short = 'a' * 5
      attr = @attr.merge :password => short, :password_confirmation => short
      User.new(attr).should_not be_valid
    end

    it "should reject long passwords" do
      long = 'a' * 41
      attr = @attr.merge :password => long, :password_confirmation => long
      User.new(attr).should_not be_valid
    end
  end

  describe "password encryption" do
    before :each do
      @user = User.create! @attr
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to :encrypted_password
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    describe "User#has_password?" do
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end

    describe "authentication method" do
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate @attr[:email], "wrongpass"
        wrong_password_user.should be_nil
      end

      it "should return nil for email with no user" do
        nonexistent_user = User.authenticate "user@yahoo.com", @attr[:password]
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = User.authenticate @attr[:email], @attr[:password]
        matching_user.should == @user
      end
    end
  end
end
