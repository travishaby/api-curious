class AddColumnLegIdToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :leg_id, :string
  end
end
