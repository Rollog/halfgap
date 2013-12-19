class UsersController < ApplicationController
	respond_to :html, :json

	def index
		@users = User.all
	end

	def new
		@disable_top_nav = true
		@disable_right_nav = true
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

    respond_to do |format|
	    format.html
	    format.json  { render :json => @user }
	  end
	end

	def update
		@user = User.find(params[:id])
	end

	def current_location
		@user = User.find(params[:id])
		lat = params[:latitude]
	  lng = params[:longitude]
	  # user needs to be logged in to update location everytime user is on the show.html page
		if @user.update(latitude: lat, longitude: lng)
		  render json: {latitude: lat, longitude: lng}
		else
			puts "FAILEDDD"
		end
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :confirm_password)
	end

end