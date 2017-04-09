class AlarmQueue < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    if !(weekend?)
      if Time.now == user.time.to_time
        # method to construct the alarm event
        puts "ALARRRRMMMM"
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
