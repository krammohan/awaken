module MapsWidget

  def self.get_transit_info(user_origin, user_destination)
  	  origin = parse_address(user_origin)
  	  destination = parse_address(user_destination)
	  url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{origin}&destinations=#{destination}&key=AIzaSyClQh63PR-vCZbOpiExvqT2ZSKQsXPkrAo"
	  response = HTTParty.get(url)
	  format_transit_info(response.parsed_response)
	  # response.parsed_response
  end


  def self.parse_address(addr)
  	addr_arr = addr.split(" ")
  	string_addr = ""
  	addr_arr.each do |element|
  	  string_addr += element + "+"
  	end
  	string_addr
  end

  def self.format_transit_info(data)
    "<div id='maps-widget' class= 'hidden' style='background-color:rgba(0, 0, 0, 0.6);'><h3 text-align='center' color='white'>Transit</h3><p id='maps'>From #{data["origin_addresses"][0]} <br>To #{data["destination_addresses"][0]} <br> #{data["rows"][0]["elements"][0]["duration"]["text"]}<br></p></div>"
  end

end