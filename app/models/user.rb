class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :login_twitter

  validates_uniqueness_of :login_twitter, :allow_nil => true
  validates_uniqueness_of :email
  validates_presence_of :name, :email

  has_many :canvases
  has_many :tweets

  after_create do
    Canvas.create(title: "#{self.name}'s canvas", user: self)
  end

  def self.all_twitter_login
    logins_twitter=Array.new
    User.all.each do |user|
      logins_twitter << user.login_twitter if user.login_twitter.present?
    end
    return logins_twitter
  end

end
