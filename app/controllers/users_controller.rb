class UsersController < ApplicationController

	def index
	end

	def show
		@vis_js = 1
		@User = User.find(params[:id])
		@Follows = Follow.where(follow_id: params[:id])

	end

	def current_show
		@vis_js = 1
		@User = User.find(current_user[:id])		
		render 'show'
	end

	def update
		@User = User.update(current_user[:id], user_params)
		redirect_to :back
	end
	def destroy
		@User = User.find(current_user[:id]).destroy
		current_user = nil
		render 'index'
	end
	def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :alias, :avatar, :location, :tagline) 
  	end
end

