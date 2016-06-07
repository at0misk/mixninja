class DashboardController < ApplicationController

	def index
		# @User = User.find(params[:id])
	end
	def show
		render :json => Track.find_by_sql("SELECT tracks.title, tracks.id, tracks.desc FROM follows LEFT JOIN users ON users.id = follows.follow_id LEFT JOIN tracks ON tracks.user_id = follows.follow_id") 
	end
end
