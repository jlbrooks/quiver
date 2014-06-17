class Group < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name
	validates :user, presence: true

	has_many :users

	belongs_to :user
end
