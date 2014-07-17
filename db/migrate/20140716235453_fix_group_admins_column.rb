class FixGroupAdminsColumn < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
  		t.remove :admin
  	end

  	add_column :groups, :admins, :intger
  end
end
