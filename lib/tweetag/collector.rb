class Tweetag::Collector

  attr_accessor :preset_account, :preset_hashtag

  def initialize(preset_account, preset_hashtag)
    @preset_account = preset_account
    @preset_hashtag = preset_hashtag

    # définition des credentials
    Twitter.configure do |config|
      config.consumer_key = "KgdRthRd0H1LvTcYMxBxJQ"
      config.consumer_secret = "dQGaEcbPPIbnM4On6eyHNrYwp1lEPGv8vM3RlxLt8" 
      config.oauth_token = "90441345-JEcCGq1OnBaAl5sNzdN2diHk1vgtLvWoKDWbXV54e" 
      config.oauth_token_secret = "YlvawOP9bAI979qBRusPStWHYvg1oQh5tF57sAfHo" 
    end
  end

  def collect
    valid_tweets=0
    tweets_info = Twitter.search("##{@preset_hashtag} from:#{@preset_account}}", :result_type => "recent").statuses
    tweets_info.each do |tweet|
      u=User.new(id_twitter: tweet.user.id, name: tweet.user.name, login_twitter: tweet.from_user)
      t=Tweet.new(text: tweet.text, user: u, id_twitter: tweet.id)
      valid_tweets+=1 if t.save
    end
    return valid_tweets
  end
end

