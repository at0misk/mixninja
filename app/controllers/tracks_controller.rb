class TracksController < ApplicationController
	def index
	end
	def show
		@Track = Track.find(params[:id])
		@Likes = Like.where(track_id: params[:id])		
		@tracklist = Tracklist.where(track_id: params[:id])

	end
	def create
		@Track = Track.new(track_params)

		puts params[:tracklist]
		if @Track.save
			puts "saved"
			a = [1,2]
			tracklist_id = Track.last.id
			@tracklist = Tracklist.create(track_id: tracklist_id, tracks: params[:tracklist])
		else
			puts "didn't save"
			puts "#{@Track}"
		end
		redirect_to :back
	end
	def destroy
		Track.find(params[:id]).destroy
		redirect_to :back
	end
	def track_params
  		params.require(:track).permit(:title, :desc, :user_id, :avatar)
	end
end
