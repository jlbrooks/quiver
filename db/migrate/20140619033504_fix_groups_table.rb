class FixGroupsTable < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
  		t.remove :has_many_members
  		t.remove :user_id
  	end

  	create_table :groups_users, id: false do |t|
  		t.belongs_to :user
  		t.belongs_to :group
  	end
  end
end
