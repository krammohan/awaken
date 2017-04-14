module CalendarWidget

    def self.get_calendar(current_user, date_time)
  # def self.configure_client(current_user)

  # Definition of client
    @client = Google::APIClient.new()

    @client.authorization.grant_type = 'authorization_code'
    @client.authorization.code = $code_for_cal
    @client.authorization.access_token = current_user.access_token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh_token

    @service =  @client.discovered_api('calendar', 'v3')

    # Get list of all the user's calendars
    response1 = @client.execute(api_method: @service.calendar_list.list)

    calendars = JSON.parse(response1.body)
    p "*" * 30
    p calendars
    p "*" * 30

    # Get Calendar Id and date_time
    calendar_id = calendars["items"][0]["id"]
    p "*" * 30
    p calendar_id
    p "*" * 30
    date_format_time = self.format_date_time(date_time)

    # get events from user based on that day
    response2 = @client.execute(api_method: @service.events.list, parameters: {calendarId: calendar_id, timeMin: date_format_time[0], timeMax: date_format_time[1]})

    # Parse the result
    data = JSON.parse(response2.body)

   # self.format_calendar_info(data)
  #  Formatting it into a string
    result = ""

    p "OBJECT" * 30
    result += "<ul>"
    data["items"].each do |event|
        if (event["start"]["dateTime"] == nil)
          result += "<br><li>#{event["summary"]}</ul></li>"
        else
          result += "<li>#{event["summary"]}"
          result += " at #{Time.parse(event["start"]["dateTime"]).strftime("%I:%M %p")}</li><br>"
        end
    end
    result += "</ul>"

    "<div class='w3-third'>
      <div class='w3-card-2 w3-container' style='min-height:360px; background-color: rgba(0,0,0,.4);'>
      <div style='color: white'>
       <h3 style='font-size:30px'>Today's Tasks</h3><br>
        <i class='fa fa-calendar w3-margin-bottom w3-text-theme' style='font-size:70px'></i>
        <p style='font-size:20px'>#{result}</p>
      </div>
      </div>
    </div>"
  end


  def self.format_date_time(date_time)
    date = date_time.split(" ")
    date = date[0].split("-")
    time_min = Time.new(date[0], date[1], date[2]).to_datetime.rfc3339
    time_max = Time.new(date[0], date[1], (date[2].to_i + 1).to_s).to_datetime.rfc3339
    [time_min, time_max]
  end

   # self.get_calendar(current_user)

end
