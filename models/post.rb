class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, :content, presence: true
  validates :title, length: { minimum: 5,
    message: "Needs more than 4 characters"}
  validates :content, length: { minimum: 2,
    message: "Needs more than 1 character"}
end
