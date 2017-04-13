module NewsWidget
  def self.get_news
    @news = HTTParty.get("https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=48e2978697514242bae24c41c66766ef") 
    input = @news["articles"][0]["title"]
    # html = format_html(@news)
    format_news(input)

  end

  def self.format_news(data)

    # "<div id='news-widget' class= 'hidden'><marquee behavior='scroll' direction='left' >" + data + " </marquee></div>"
    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px'>
       <h3>Current News</h3><br>
        <i class='fa fa-newspaper-o w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
        <p>#{data}</p>
      </div>
    </div>"

  end

  def self.format_html(input)
    html = ""
    # input["articles"][0]["title"]
    input["articles"].each do |inp|

      inp["title"]
      # html += "      |      "
    end
    return html
  end 
end

