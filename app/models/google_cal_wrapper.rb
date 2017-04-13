module GoogleCalWrapper

  def self.configure_client(current_user)
    @client = Google::APIClient.new()
    p "*" * 30
    p @client
    p "*" * 30
    @client.authorization.grant_type = 'authorization_code'
    @client.authorization.code = '4/Z4GdlXlf2vK_dp04p16Kb_2p8WEtIilpFf9dlSCAXSg'
    @client.authorization.access_token = current_user.access_token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh_token
    @service = @client.discovered_api('calendar', 'v3')
  end
  def self.calendar_see(current_user)
    p "*CALENDAR"*34
    p user = current_user
    response1 = @client.execute(api_method: @service.calendar_list.list)
    calendars = JSON.parse(response1.body)
    calendar_id = calendars["items"][0]["id"]
    response2 = @client.execute(api_method: @service.events.list, parameters: {calendarId: calendar_id})

    c = JSON.parse(response2.body)
  end
end