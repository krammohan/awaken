module WeatherWidget
  def self.get_weather(zip)
    location_hash = ZipCodes.identify(zip)
    location = "#{location_hash[:city]}, #{location_hash[:state_code]}"
    response = Weather.lookup_by_location(location, Weather::Units::FAHRENHEIT)
    format_weather(response)
  end

  def self.format_weather(data)
    "<div id='weather-widget' class= 'hidden' style='background-color:rgba(0, 0, 0, 0.6);'><h3 text-align='center' color='white'>Weather<img id='weather-icon' src='#{data.image.url}' height='60' width='60'></img></h3><p id='weather'>#{data.location.city} <br>#{data.condition.temp}° <br>#{data.condition.text} <br>Wind: #{data.wind.speed}mph <br></p></div>".html_safe
  end
end
