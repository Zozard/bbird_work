require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
    FactoryGirl.build(:user).should be_valid
  end

  describe "#name" do
    it "is present" do
      FactoryGirl.build(:user, name: nil).should_not be_valid
    end
  end

  describe "#login_twitter" do
    it "is unique" do
      FactoryGirl.build(:user, login_twitter: user.login_twitter).should_not be_valid
    end
  end

  describe "#email" do
    it "is not valid if email already in db" do
      FactoryGirl.build(:user, email: user.email).should_not be_valid
    end
  end

  describe "#all_twitter_login" do
    it "returns twitter logins of users having twitter accounts" do
      FactoryGirl.create(:user, login_twitter: "one")
      FactoryGirl.create(:user, login_twitter: "two")
      FactoryGirl.create(:user, login_twitter: nil)
      User.all_twitter_login.should eq(["one","two"])
    end
  end

  describe "associations" do
    it "have at least one canvas" do
      Canvas.where(user_id: user.id).should_not be_empty
    end
  end

end
