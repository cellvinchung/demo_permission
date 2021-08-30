class CreateGroupPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :group_permissions do |t|
      t.belongs_to :user_group, null: false, foreign_key: true
      t.belongs_to :permission_resource, null: false, foreign_key: true
      t.integer :priority

      t.timestamps
    end
    add_index :group_permissions, :priority
  end
end
