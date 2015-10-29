class AddColumnFecIdsToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :fec_ids, :string
  end
end
