class UsersController < ApplicationController

	def index
	end

	def show
		@User = User.find(params[:id])
	end

	def current_show
		@User = User.find(current_user[:id])
		render 'show'
	end

	def update
		@User = User.update(current_user[:id], user_params)
		redirect_to :back
	end
	def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :alias, :avatar, :location, :tagline) 
  	end
end

