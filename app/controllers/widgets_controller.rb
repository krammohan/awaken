class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		@content = User.find(params[:user_id]).content.html_safe
    
    @news = HTTParty.get("https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=48e2978697514242bae24c41c66766ef")
    p "*" * 100
    p @news.parsed_response["articles"][0]["title"]
	end

end
