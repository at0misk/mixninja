class AddTrackToTracklist < ActiveRecord::Migration
  def change
  	add_column  :tracklists, :tracks, :json, default: []
  	# add_column  :tracklists, :tracks, :string, array: true, default: []

  end
end
