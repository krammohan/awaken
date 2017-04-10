class AlarmQueue < ActiveJob::Base
  queue_as :default
  def perform(user_id, pubnub)
    user = User.find(user_id)
    if !(weekend?)
      if Time.now.strftime("%I:%M") == user.time.strftime("%I:%M")
        user.check_and_construct
        # Generate Pub/Sub connection and turn on TV
        $pubnub.publish( channel: 'my_channel', message: { action: true, url: 'heroku' }) do |envelope|
            puts envelope.status
          end
        puts "ALARRRRMMMM"
      elsif (Time.now.strftime("%I:%M") == ((user.time.to_time) + 20*60).strftime("%I:%M"))# if its been more than 20 minutes since the alarm went off, turn off the TV.
        $pubnub.publish( channel: 'my_channel', message: { action: false }) do |envelope|
            puts envelope.status
          end
        puts "GOOOOODBYE"
      end
    end
  end
  private
    def weekend?
      time = Time.now.wday
      return true if (time == 0 || time == 6)
      false
    end
end