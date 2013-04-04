class User < ActiveRecord::Base
  has_many :conversations
  validates_presence_of :username, :email, :crypted_password, :password_salt
  validates :username, :length => { :in => 2..12 },
                   :presence => true,
                   :uniqueness => true
  has_many :conversations, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  acts_as_authentic

end
