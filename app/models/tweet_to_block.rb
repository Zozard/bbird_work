class TweetToBlock < ActiveRecord::Base
  attr_accessible :tweet_id, :id_case 

  belongs_to :tweet

  validates_inclusion_of :id_case, :in => 1..9

  validates_uniqueness_of :tweet_id, :scope => :id_case

  validates_presence_of :tweet_id, :id_case

end
