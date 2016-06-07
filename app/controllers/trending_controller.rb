class TrendingController < ApplicationController

	def index
	end
	def show
		render :json => Track.find_by_sql("SELECT tracks.title, tracks.id, tracks.desc, COUNT(likes.id) AS num_of_likes FROM tracks JOIN likes ON likes.track_id = tracks.id GROUP BY tracks.id ORDER BY num_of_likes DESC")
	end

end
