class DevicesController < ApplicationController
  def connect
    @serial = params[:id]
    if Device.find_by(serial: @serial)
      #send the matching url and pubnub connection info
      #potentially redirect to a success page, telling users they are good to turn off their screen
    else
      respond_to do |format|
        format.json do
          render json: {
            message: "success",
            url: "http://localhost3000/users/#{@serial}/widgets"

          }.to_json
        end
      end
      #Send url for the instructions handler and placeholder pubnub info
    end
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(user_id: current_user.id, serial: params[:device][:serial])
    p "*" * 35
    p params
    p "*" * 35
    if @device.save
      redirect_to user_path(current_user.id)
    end
  end

end
