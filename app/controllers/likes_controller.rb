class LikesController < ApplicationController
	def create
		@Like = Like.new(like_params)
		if @Like.save
			puts "saved"
		else
			puts "didn't save"
			puts "#{@Like}"
		end
		redirect_to :back
	end
	def destroy
		@Like = Like.where(like_params)
		Like.destroy(@Like)
		redirect_to :back
	end
	def like_params
  		params.require(:like).permit(:track_id, :user_id)
	end
end
