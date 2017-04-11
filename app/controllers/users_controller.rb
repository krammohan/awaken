class UsersController < ApplicationController

	def show
	  @user = current_user
	end

	def update
		update_status = current_user.update(user_params)
		flash.notice = "ALARM UPDATED THO"

		# find the jobs and kill from the user
		# rufus = scheduler.at('2017-04-10 17:14', :user_id => 1) do print "KAVYAAAAA" end
		# 	time = "this is the time"
		puts "*" * 30
		puts "Time:"
		puts Time.now
		puts "*" * 30

			$scheduler.jobs(:user_id => current_user.id).each do |job|
					if job.scheduled_at.includes? time.split(" ")[0]
						job.unschedule
					end
			end

			user_job = $scheduler.at('2017-04-11 1:24 PDT', :user_id => current_user.id) do
				# @user.construct_widgets
				pub_nub_job
			end

		# .strftime("%Y-%m-%d %H:%M")

    respond_to do |format|
        # AlarmQueue.perform_now(current_user.id)
        # render text: "ALARM SETTING HAS BEEN ADDED TO THE QUEUE"
        format.html { redirect_to current_user, notice: 'Alarm was successfully updated.' }
        format.json { render :show, status: :created, location: current_user }
    end
  end

	def change_weather
		current_user.toggle_weather
	end

  def change_maps
    current_user.toggle_maps
  end

private

  def user_params
    params.require(:user).permit(:time, :weather, :zip, :origin_location, :destination_location, :mode, :transit_mode, :maps)
  end

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
