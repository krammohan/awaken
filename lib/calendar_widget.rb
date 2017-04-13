module CalendarWidget

    def self.get_calendar(current_user)
  # def self.configure_client(current_user)
    @client = Google::APIClient.new()

    @client.authorization.grant_type = 'authorization_code'
    @client.authorization.code = '4/Z4GdlXlf2vK_dp04p16Kb_2p8WEtIilpFf9dlSCAXSg'
    @client.authorization.access_token = current_user.access_token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh_token

    @service =  @client.discovered_api('calendar', 'v3')

    response1 = @client.execute(api_method: @service.calendar_list.list)

    calendars = JSON.parse(response1.body)

    calendar_id = calendars["items"][0]["id"]

    response2 = @client.execute(api_method: @service.events.list, parameters: {calendarId: calendar_id})

    data = JSON.parse(response2.body)

   # self.format_calendar_info(data)
    result = ""

    p "OBJECT" * 30
    data["items"].each do |event|
        result += "<br>#{event["summary"]}<br>"
        if !(event["start"]["dateTime"] == nil)
            result += "Start: <br>#{Time.parse(event["start"]["dateTime"]).to_s.split(" ")[1]}"
            result += "<br>End: #{Time.parse(event["end"]["dateTime"]).to_s.split(" ")[1]}"
        end
    end

    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px'>
       <h3>Today's Tasks</h3><br>
        <i class='fa fa-map-marker w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
        <p>#{result}</p>
      </div>
    </div>"
  end

   # self.get_calendar(current_user)

end