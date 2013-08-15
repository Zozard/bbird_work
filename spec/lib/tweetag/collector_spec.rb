require 'spec_helper'

describe Tweetag::Collector do
  before(:each) do
    @db_length = Tweet.count
    @retriever = Tweetag::Collector.new("z0zard","bbird")  
    @nb_insert_success = @retriever.collect
  end

  describe "#collect" do
    it "inserts new tweets in the database" do
      expect(Tweet.count).to eq(@db_length+@nb_insert_success)
    end


  end

  describe "tweets" do 
    it "come from the account of our db-users" do
      Tweet.all.each do |received_tweet|
        expect(@retriever.User.all_twitter_login).to include(received_tweet.user.id)
      end
    end

    it "contain with the hashtag we want" do 
      Tweet.all.each do |received_tweet|
        expect(received_tweet.text).to include("##{@retriever.preset_hashtag}")
      end
    end
  end
end


