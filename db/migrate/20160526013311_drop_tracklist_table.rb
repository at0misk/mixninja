class DropTracklistTable < ActiveRecord::Migration
  def change
  	drop_table :tracklists
  end
end
