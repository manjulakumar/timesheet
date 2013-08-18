class AddCreatedByToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :created_by, :string
  end
end
