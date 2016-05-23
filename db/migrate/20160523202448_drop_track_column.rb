class DropTrackColumn < ActiveRecord::Migration
  def change
  	remove_column(:tracks, :SERIAL)
  	remove_column(:tracks, :HSTORE)
  	remove_column(:tracks, :time)
  	remove_column(:tracks, :track_name)
  end
end
