class UsersController < ApplicationController
	respond_to :html, :json

	def index
		@users = User.all
		# @users = @user.nearbys(params[:radius])
		# respond_with @users
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

    respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @user }
	  end
	  
	end

	def edit
		
	end

	def update
		# @user = User.find(params[:id])
		# @user.update(user_params)

		# respond_to do |fmt|
		#   fmt.html
		#   fmt.json {
		# 	  lat = params[:latitude]
		# 	  lng = params[:longitude]
		# 	  render json: {latitude: lat, longitude: lat}
		#   }
	 #  end
	end

	def store_location
		@user = User.find(params[:id])
		if @user.update(params[:user])
			lat = params[:latitude]
		  lng = params[:longitude]
		  render json: {latitude: lat, longitude: lng}
		else
			puts "FAILEDDD"
		end
		
	  
	  end

	#   current_user.latitude = params[:latitude]
	#   current_user.longitude = params[:longitude]
	#   current_user.save

	# end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :confirm_password, :latitude, :longitude)
	end

end