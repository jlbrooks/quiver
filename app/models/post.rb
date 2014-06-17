class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :post
  has_many :comment
  belongs_to :user
end