class CreatePermissionResources < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_resources do |t|
      t.string :name
      t.integer :default_priority, default: 0

      t.timestamps
    end
    add_index :permission_resources, :default_priority
  end
end
