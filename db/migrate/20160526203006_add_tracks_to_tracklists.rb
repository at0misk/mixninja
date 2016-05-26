class AddTracksToTracklists < ActiveRecord::Migration
  def change
  	add_column :tracklists, :tracks, :string
  end