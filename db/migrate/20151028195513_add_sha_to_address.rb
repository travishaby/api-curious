class AddShaToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :sha, :string
  end
end
