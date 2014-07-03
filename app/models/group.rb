class Group < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name

	has_and_belongs_to_many :users, before_add: :validate_unique_user

	def validate_unique_user(user)
		if users.exists?(user)
			errors.add(:user, " is already in group")
			raise ActiveRecord::Rollback 
		end
	end



end
