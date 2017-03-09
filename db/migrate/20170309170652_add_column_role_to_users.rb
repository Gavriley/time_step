class AddColumnRoleToUsers < ActiveRecord::Migration[5.0]

  def up
    add_column :users, :role, :integer, default: 0
  end

  def down
    remove_column :users, :role
  end

end
