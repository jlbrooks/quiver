class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :has_many_members
      t.text :description

      t.timestamps
    end
  end
end
