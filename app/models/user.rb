class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :login_twitter
  has_many :tweets
  validates_uniqueness_of :login_twitter, :allow_nil => true
  validates_uniqueness_of :email
  validates_presence_of :name

  has_many :canvases

  def self.all_twitter_login
    logins_twitter=Array.new
    User.all.each do |user|
      logins_twitter << user.login_twitter if user.login_twitter.present?
    end
    return logins_twitter
  end

end
