class UsersController < ApplicationController
	respond_to :html, :json

	def index
		# @users = User.all
		@users = @user.nearbys(params[:radius])
		respond_with @users
	end

	def new
		@user = User.new		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		end
	end

	def show
    @user = User.find(params[:id])
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :confirm_password)
	end

end