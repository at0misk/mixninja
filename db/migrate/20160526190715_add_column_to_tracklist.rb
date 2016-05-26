class AddColumnToTracklist < ActiveRecord::Migration
  def change
  	add_column :tracklists, :tracks, :string
  end
end
