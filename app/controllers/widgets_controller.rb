class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		@content = User.find(params[:user_id]).content.html_safe
	end
	end

end
