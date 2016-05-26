class CreateTracklists < ActiveRecord::Migration
  def change
    create_table :tracklists do |t|
      t.references :track, index: true

      t.timestamps null: false
    end
    add_foreign_key :tracklists, :tracks
  end
end
