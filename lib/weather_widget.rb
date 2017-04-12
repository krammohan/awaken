module WeatherWidget
  def self.get_weather(zip)
    location_hash = ZipCodes.identify(zip)
    location = "#{location_hash[:city]}, #{location_hash[:state_code]}"
    response = Weather.lookup_by_location(location, Weather::Units::FAHRENHEIT)
    format_weather(response)
  end

  def self.format_weather(data)
    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px'>
       <h3>Weather</h3><br>
        <i class='fa fa-sellsy w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
        <p>#{data.location.city}</p>
        <h3>#{data.condition.temp}°</h3>
        <p>#{data.condition.text}</p>
        <p>Windshield: #{data.wind.speed}mph</p>
      </div>
    </div>"
  
# <img id="weather-icon" src="#{data.image.url}" height="60" width="60"></img><br>

  end
end
