class TracksController < ApplicationController
	def index
	end
	def show
		@Track = Track.find(params[:id])
	end
	def create
		@Track = track_params
		puts track_params
		redirect_to :back
	end
	def track_params
  		params.require(:track).permit(:title, :description, :user_id, :avatar)
	end
end
