class AddEffectiveDateToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :effective_date, :date
  end
end
