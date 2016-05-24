class TracksController < ApplicationController
	def index
	end
	def show
		@Track = Track.find(params[:id])
	end
	def create
		@Track = Track.new(track_params)
		if @Track.save
			puts "saved"
		else
			puts "didn't save"
			puts "#{@Track}"
		end
		redirect_to :back
	end
	def track_params
  		params.require(:track).permit(:title, :desc, :user_id, :avatar)
	end
end
