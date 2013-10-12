class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 2,
    message: "Needs more than 1 character" }
end
