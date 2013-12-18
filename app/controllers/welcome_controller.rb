class WelcomeController < ApplicationController
	def index
		@disable_top_nav = true
		@disable_right_nav = true
  end
end