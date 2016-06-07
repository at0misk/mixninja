class TracksController < ApplicationController
	def index
	end
	def show
		@vis_js = 1
		@Track = Track.find(params[:id])
		@Likes = Like.where(track_id: params[:id])		
		@tracklist = Tracklist.where(track_id: params[:id])
		num = 3 
		@timeArr = []
		for i in 0..@tracklist[0].tracks.to_a.flatten.length 
			if i == num
				@timeArr << @tracklist[0].tracks.to_a.flatten[i] 
				 num += 4 
			end 
		end 	

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
		redirect_to "/users/#{current_user[:id]}"
	end
	def track_params
  		params.require(:track).permit(:title, :desc, :user_id, :avatar)
	end
	def divDex
  		# @Follows = Follow.where(follow_id: params[:id])
  		@Track = Track.find(params[:id])
  		render :partial => "likeDiv", :layout => false
  	end
end
