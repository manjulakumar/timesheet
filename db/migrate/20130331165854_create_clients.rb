class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.references :project
      t.timestamps
       t.integer :organization

    end

      add_index :clients, :organization_id
    
  end
end
