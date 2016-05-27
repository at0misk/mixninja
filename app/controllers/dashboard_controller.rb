class DashboardController < ApplicationController

	def index
		# @User = User.find(params[:id])
	end
	def show
		render :json => User.find_by_sql("SELECT tracks.title, tracks.desc, tracks.id FROM users LEFT JOIN follows ON users.id = follows.user_id LEFT JOIN tracks ON follows.follow_id = tracks.user_id")
	end
end
