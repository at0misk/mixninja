class CreateTracklists < ActiveRecord::Migration
  def change
    create_table :tracklists do |t|
      t.integer :track_id
      t.string :tracks
      t.timestamps null: false
    end
  end
end

