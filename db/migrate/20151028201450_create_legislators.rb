class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :leg_id
      t.string :transparencydata_id
      t.string :level
      t.string :chamber
      t.string :party
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
