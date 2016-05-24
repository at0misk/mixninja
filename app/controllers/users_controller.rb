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
	# def user_params
 #  	params.require(:user).permit(:first_name, :last_name, :email, :reason, :description, :request, :password, :balance, :account_type) 
 #  	end
end

