class AddColumnTeamToUsers < ActiveRecord::Migration[5.0]

  def up
    add_column :users, :team_id, :integer
  end

  def down
    remove_column :users, :team_id
  end

end
