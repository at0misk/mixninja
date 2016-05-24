class CommentsController < ApplicationController
	def create
		@Comment = Comment.new(comment_params)
		if @Comment.save
			puts "saved"
		else
			puts "didn't save"
			puts "#{@Comment}"
		end
		redirect_to :back
	end
	def comment_params
  		params.require(:comment).permit(:track_id, :content, :user_id)
	end
end
