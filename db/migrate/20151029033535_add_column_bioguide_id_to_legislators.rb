class AddColumnBioguideIdToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :bioguide_id, :string
  end
end
