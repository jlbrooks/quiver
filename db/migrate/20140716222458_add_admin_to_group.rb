class AddAdminToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :admin, :string
  end
end
