class DashboardController < ApplicationController

	def index
	end
	def show
		render :json => Track.all
	end
end
