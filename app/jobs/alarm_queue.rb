class AlarmQueue < ActiveJob::Base
  queue_as :default
  def perform(user_id)
    user = User.find(user_id)
    scheduler = Rufus::Scheduler.new
    scheduler.every '1m' do
        pub_nub_job
    end
  end

  private
    def pub_nub_job
      $pubnub.publish( channel: 'my_channel', message: { action: true, url: 'heroku' }) do |envelope|
          puts envelope.status
        end
      sleep (10)
      $pubnub.publish( channel: 'my_channel', message: { action: false }) do |envelope|
          puts envelope.status
        end
    end
end
