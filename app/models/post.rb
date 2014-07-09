class Post < ActiveRecord::Base
  extend ActiveModel::Naming

  validates :title, presence: true
  validates :body, presence: true

  has_many :posts
  has_many :comments
  belongs_to :user
  belongs to :group

  attr_accessor :excerpt
end