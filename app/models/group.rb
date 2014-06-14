class Group < ActiveRecord::Base
	validates :name, presence: true
	validates :has_many_members, presence: true
	validates :name, uniqueness: true 
end
