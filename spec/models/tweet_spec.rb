require 'spec_helper'

describe Tweet do
  let(:tweet) { FactoryGirl.create(:tweet) }
    
  it "has a valid factory" do
    FactoryGirl.create(:tweet).should be_valid
    FactoryGirl.build(:tweet).should be_valid
  end

  describe "#user" do
    it "is present" do
      FactoryGirl.build(:tweet, user: nil)
    end
  end

  describe "#id_twitter" do
    it "is uniq" do 
      FactoryGirl.build(:tweet,id_twitter: tweet.id_twitter).should_not be_valid
    end

    it "is present" do
      FactoryGirl.build(:tweet, id_twitter: nil).should_not be_valid
    end
  end

end
