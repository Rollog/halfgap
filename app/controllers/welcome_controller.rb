class WelcomeController < ApplicationController
	def index
		@disable_large_nav = true
		@disable_top_nav = true
		@disable_right_nav = true
  end
end