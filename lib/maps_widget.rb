module MapsWidget

  #This method is to be called if the user specifies they are traveling via public transit
  def self.get_transit_info(user_origin, user_destination, user_transit)
	  origin = parse_address(user_origin)
    destination = parse_address(user_destination)
    transit_mode = user_transit
	  url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&departure_time=#{Time.now.to_i}&mode=transit&transit_mode=#{transit_mode}&key=AIzaSyClQh63PR-vCZbOpiExvqT2ZSKQsXPkrAo"
	  response = HTTParty.get(url)

    distance = response.parsed_response["routes"][0]["legs"][0]["distance"]["text"]
    duration = response.parsed_response["routes"][0]["legs"][0]["duration"]["text"]
    summary = response.parsed_response["routes"][0]["summary"]
    mode = "Commuting by #{user_transit}:"

    format_transit_info(mode, distance, duration)
	  # format_transit_info(response.parsed_response)
  end

  #This method is to be called if the user specifies they are traveling by car
  def self.get_driving_info(user_origin, user_destination)
  	origin = parse_address(user_origin)
  	destination = parse_address(user_destination)
	  url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&departure_time=#{Time.now.to_i}&mode=driving&key=AIzaSyClQh63PR-vCZbOpiExvqT2ZSKQsXPkrAo"

	  response = HTTParty.get(url)
    distance = response.parsed_response["routes"][0]["legs"][0]["distance"]["text"]
    duration_in_traffic = response.parsed_response["routes"][0]["legs"][0]["duration_in_traffic"]["text"]
    summary = response.parsed_response["routes"][0]["summary"]
    mode = "Commuting by car:"

    format_transit_info(mode, distance, duration_in_traffic)

  end

# https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood4&key=AIzaSyClQh63PR-vCZbOpiExvqT2ZSKQsXPkrAo



# url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=AIzaSyClQh63PR-vCZbOpiExvqT2ZSKQsXPkrAo"


  def self.parse_address(addr)
  	addr_arr = addr.split(" ")
  	string_addr = ""
  	addr_arr.each do |element|
  	  string_addr += element + "+"
  	end
  	string_addr
  end

  def self.format_transit_info(mode, distance, duration)
    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px; background-color: rgba(0,0,0,.2);'>
       <div style='color: white'>
       <h3 style='font-size:30px'>Transit</h3><br>
        <i class='fa fa-map-marker w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
        <p style='font-size:20px'>#{mode}</p>
        <p style='font-size:20px'>It will take you approximately #{duration} to arrive at your destination.</p>
        <p style='font-size:20px'>Distance: #{distance}</p>
      </div>
      </div>
    </div>"
  end

end
