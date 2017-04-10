class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		@zip = current_user.zip
		@weather = current_user.weather
		# @distance = current_user.commute
		# @origin_location = current_user.origin_location
		# @destination_location = current_user.destination_location
		# @mode = current_user.mode
		# @transit_mode = current_user.transit_mode
		end
	end

end
