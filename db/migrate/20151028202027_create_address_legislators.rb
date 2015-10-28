class CreateAddressLegislators < ActiveRecord::Migration
  def change
    create_table :address_legislators do |t|
      t.references :address, index: true, foreign_key: true
      t.references :legislator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
