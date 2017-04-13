module WeatherWidget
  def self.get_weather(zip)
    location_hash = ZipCodes.identify(zip)
    location = "#{location_hash[:city]}, #{location_hash[:state_code]}"
    response = Weather.lookup_by_location(zip, Weather::Units::FAHRENHEIT)
    format_weather(response)
  end

  def self.find_icon(condition)
    if condition == "Sunny" || condition == "Clear"
      icon = "<i class='fa fa-sun-o' w3-margin-bottom w3-text-theme' style='font-size:70px'></i>"
    elsif condition == "Rainy"
      icon = "<i class='fa fa-tint' aria-hidden='true' w3-margin-bottom w3-text-theme style='font-size:70px'></i>"
    elsif condition == "Thunderstorms"
      icon = "<i class='fa fa-bolt' aria-hidden='true' w3-margin-bottom w3-text-theme style='font-size:70px'></i> "
    elsif condition == "Snow"
      icon = "<i class='fa fa-snowflake-o' aria-hidden='true' w3-margin-bottom w3-text-theme style='font-size:70px'></i> "
    elsif condition == "Cloudy" || condition == "Partly Cloudy"
      icon = "<i class='fa fa-cloud' aria-hidden='true' w3-margin-bottom w3-text-theme style='font-size:70px'></i> "
    else
      icon = "<i class='fa fa-sellsy w3-margin-bottom w3-text-theme' style='font-size:70px'></i>"
    end
  end

  def self.format_weather(data)
    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px'>
       <h3>Weather</h3><br>
        #{find_icon(data.condition.text)}
        <p>#{data.location.city}</p>
        <h3>#{data.condition.temp}°</h3>
        <p>#{data.condition.text}</p>
        <p>Wind: #{data.wind.speed}mph</p>
      </div>
    </div>"

# <img id="weather-icon" src="#{data.image.url}" height="60" width="60"></img><br>
#<i class='fa fa-sellsy w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
  end
end
