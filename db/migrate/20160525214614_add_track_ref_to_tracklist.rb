class AddTrackRefToTracklist < ActiveRecord::Migration
  def change
    add_reference :tracklists, :track, index: true
    add_foreign_key :tracklists, :tracks
  end
end
