class AnotherFixForGroupAdmins < ActiveRecord::Migration
  def change
  	  	change_table :groups do |t|
  		t.remove :admins
  	end

  	add_column :groups, :admins, :text
  end
end
