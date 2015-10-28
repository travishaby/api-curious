class AddColumnShaToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :sha, :string
  end
end
