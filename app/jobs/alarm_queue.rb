class AlarmQueue < ActiveJob::Base
  queue_as :default

  def perform(user_id, pubnub)
    user = User.find(user_id)
    if !(weekend?)
      if Time.now == user.time.to_time
        # Generate Pub/Sub connection and turn on TV
        pubnub.publish( channel: 'my_channel', message: { text: true, status: 'hello' }) do |envelope|
            puts envelope.status
          end
        # method to construct the alarm event
        puts "ALARRRRMMMM"

      elsif (Time.now == ((user.time.to_time) + 20*60))# if its been more than 20 minutes since the alarm went off, turn off the TV.
        pubnub.publish( channel: 'my_channel', message: { text: false, status: 'hello' }) do |envelope|
            puts envelope.status
          end

        # method to construct the alarm event
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
