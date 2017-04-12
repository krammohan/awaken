module NewsWidget
  def self.get_news
    @news = HTTParty.get("https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=48e2978697514242bae24c41c66766ef") 
    html = format_html(@news)
    format_news(html)

  end

  def self.format_news(data)

    "<div id='news-widget' class= 'hidden'><marquee behavior='scroll' direction='left' >" + data + " </marquee></div>"
  end

  def self.format_html(input)
    html = ""
    input["articles"].each do |inp|

      html += inp["title"]
      html += "      |      "
    end
    return html
  end 
end

