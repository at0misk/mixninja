class LikesController < ApplicationController
	def create
		@Like = Like.new(like_params)
		@Like.save
		@User = User.find(current_user[:id])
		respond_to do |format|
		format.html { render json: @Like, status: :created, location: @Like }
	    format.json { render json: @Like, status: :created, location: @Like }
	    format.js { render json: @Like, status: :created}
    	end
    	# redirect_to :back
	end
	def destroy
		@Like = Like.find_by(like_params)
		puts like_params
		puts "#{@Like} words ASLKDJFHLASJHDF"
		@User = User.find(current_user[:id])
		Like.destroy(@Like.id)
	   		respond_to do |format|
	   			format.html { render json: @Like, status: :created, location: @Like }
	    		format.json { render json: @Like, status: :created, location: @Like }
			    format.js   { head :ok }
	   end
	end
	def like_params
  		params.require(:like).permit(:track_id, :user_id)
	end
end
