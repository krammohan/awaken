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
            message: "success"
          }.to_json
        end
      end
      #Send url for the instructions handler and placeholder pubnub info
    end
  end
end
