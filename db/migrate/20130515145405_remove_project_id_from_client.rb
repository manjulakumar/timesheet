class RemoveProjectIdFromClient < ActiveRecord::Migration
  def up
    remove_column :clients, :project_id
  end

  def down
    add_column :clients, :project_id, :integer
  end
end
