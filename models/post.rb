class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :content, presence: true
  validates :title, length: { minimum: 5, 
    message: "That will be waaaaaaaaaaaaaaaaaay too short."}
end
