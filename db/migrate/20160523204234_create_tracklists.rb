class CreateTracklists < ActiveRecord::Migration
  def change
    create_table :tracklists do |t|
      t.string :track_name
      t.string :start

      t.timestamps
    end
  end
end
