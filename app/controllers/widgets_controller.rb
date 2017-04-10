class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		@zip = current_user.zip
	end

end