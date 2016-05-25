class FollowsController < ApplicationController
	def create
		@Follow = Follow.new(follow_params)
		if @Follow.save
			puts "saved"
		else
			puts "didn't save"
			puts "#{@Follow}"
		end
		redirect_to :back
	end
	def destroy
		@Follow = Follow.where(follow_params)
		Follow.destroy(@Follow)
		redirect_to :back
	end
	def follow_params
  		params.require(:follow).permit(:follow_id, :user_id)
	end
end
