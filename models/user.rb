class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  validates :username, :password, presence: true
  validates :username, length: { minimum: 3,
    message: "Needs at least 3 characters" }
  validates :password, length: { minimum: 7,
    message: "Needs at least 7 characters" }
  validates_uniqueness_of :username
end
