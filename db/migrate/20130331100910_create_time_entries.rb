class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :minutes
      t.references :project
      t.text :description
      t.boolean :billable
      t.references :user

      t.timestamps
    end
    add_index :time_entries, :project_id
    add_index :time_entries, :user_id
  end
end
