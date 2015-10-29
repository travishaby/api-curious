class ChangeColumnInLegislatorsFromLegIdToVotesmartId < ActiveRecord::Migration
  def change
    rename_column :legislators, :leg_id, :votesmart_id
  end
end
