class Tweet < ActiveRecord::Base
  attr_accessible :id_twitter, :text, :user, :canvas_id, :id_case, :user_id

  validates_uniqueness_of :id_twitter
  validates_presence_of :id_twitter

  belongs_to :canvas
  validates_presence_of :canvas_id

  has_many :tweet_to_blocks

  belongs_to :user
  validates_presence_of :user


  def self.associate_block(tweet_html_id,id_case_html)
   
    # les id donnés à cette fonction sont de forme tweet_2 et block_2 
    tweet_html_id.slice!("tweet_")
    id_case_html.slice!("block_")

    TweetToBlock.create(id_case: Integer(id_case_html), tweet_id: Integer(tweet_html_id))
    
  end


end
