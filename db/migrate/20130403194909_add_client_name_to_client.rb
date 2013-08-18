class AddClientNameToClient < ActiveRecord::Migration
  def change
    add_column :clients, :client_name, :string
  end
end
