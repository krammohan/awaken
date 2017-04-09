class AlarmQueue < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    puts "ALARRRRMMMM"
    user = User.find(user_id)
    if Time.now == user.time.to_time
      # method to construct the alarm event
    end
  end

end
