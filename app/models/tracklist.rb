class Tracklist < ActiveRecord::Base
	belongs_to :track
	serialize :tracks
end
