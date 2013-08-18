class AddProjectIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :project_id, :integer
  end
end
