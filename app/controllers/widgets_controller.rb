class WidgetsController < ApplicationController

	def index
		@skip_layout = true
<<<<<<< HEAD
=======
		@content = User.find(params[:user_id]).content.html_safe
	end
>>>>>>> 0bf1d4e0abdde21df36f441e6c57c208a67827b3
	end

end
