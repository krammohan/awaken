class DevicesController < ApplicationController
  def connect
    @serial = params[:id]
    @device = Device.find_by(serial: @serial)
    if @device
      #send the matching url and pubnub connection info
      #potentially redirect to a success page, telling users they are good to turn off their screen
      user_channel = @device.user.channel
      respond_to do |format|
        format.json do
          render json: {
            message: "registered",
            url: "http://awakenapp.herokuapp.com/users/#{@device.user.id}/widgets",
            channel: user_channel
          }.to_json
        end
      end
    else
      respond_to do |format|
        format.json do
          render json: {
            message: "not registered",
            url: "http://awakenapp.herokuapp.com/devices/info/#{@serial}",
            channel: "generic"
          }.to_json
        end
      end
      #Send url for the instructions handler and placeholder pubnub info
    end
  end

  def new
    @device = Device.new
    if !current_user.channel
      current_user.set_channel
    end
  end

  def create
    @device = Device.new(user_id: current_user.id, serial: params[:device][:serial])
    if @device.save
      redirect_to user_path(current_user.id)
    end
  end

  def info
    @serial = params[:id]
  end

end
