class Tweet < ActiveRecord::Base
  attr_accessible :id_twitter, :text, :user

  validates_uniqueness_of :id_twitter
  validates_presence_of :id_twitter

  belongs_to :user
  validates_presence_of :user
end
