class AddOrganizationIdToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :organization_id, :integer
  end
end
