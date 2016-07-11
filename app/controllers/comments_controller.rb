class CommentsController < ApplicationController
	def create
		@Comment = Comment.new(comment_params)
		if @Comment.save
			respond_to do |format|
			format.html { render json: @Comment, status: :created}
		    format.json { render json: @Comment, status: :created}
		    format.js { render json: @Comment, status: :created}
    	end
		else
			puts "didn't save"
			puts "#{@Comment}"
		end
	end
	def comment_params
  		params.require(:comment).permit(:track_id, :content, :user_id)
	end
	def commentDex
		@Track = Track.find(params[:id])
  		render :partial => "commentDiv", :layout => false
	end
	def destroy
		Comment.find(params[:id]).destroy
		redirect_to :back
	end
end
