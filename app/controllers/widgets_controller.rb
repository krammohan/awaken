class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		#### USED FOR TESTS ####
		$pubnub.publish( channel: 'my_channel', message: { action: true, url: 'heroku' }) do |envelope|
				puts envelope.status
			end
		##### DELETE IN THE FUTURE ###
	end

end
