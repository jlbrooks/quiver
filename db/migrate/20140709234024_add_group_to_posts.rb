class AddGroupToPosts < ActiveRecord::Migration
  def change
  	change_table(:posts) do |t|
      t.belongs_to :group
    end
  end
end
