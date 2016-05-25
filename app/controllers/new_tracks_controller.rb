class NewTracksController < ApplicationController
	def index
	end
	def show
		render :json => Track.order('created_at DESC')
	end
end
