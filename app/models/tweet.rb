class Tweet < ActiveRecord::Base
  attr_accessible :id_twitter, :text, :user, :canvas_id, :id_case, :user_id

  validates_uniqueness_of :id_twitter
  validates_presence_of :id_twitter

  belongs_to :canvas
  validates_presence_of :canvas_id

  has_and_belongs_to_many :blocks

  belongs_to :user
  validates_presence_of :user

end
