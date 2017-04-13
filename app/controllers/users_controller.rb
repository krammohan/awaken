class UsersController < ApplicationController

	def show
	  @user = current_user
	end

	def update
		update_status = current_user.update(user_params)

			# Not working 100% => needs to know if it's the same day!!
			#
			# $scheduler.jobs(:user_id => current_user.id).each do |job|
			# 			p job
			# 			p "*" * 30
			# 		if job.scheduled_at.includes? user.time.split(" ")[0]
			# 			job.unschedule
			# 		end
			# end

			p "*"*30
			p "User information"
			p current_user
			p "*"*30


			user_job = $scheduler.at(date_time, :user_id => current_user.id) do
				current_user.construct_widgets
				# Render something?
				pub_nub_job
			end

			p user_job

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

  def change_news
    current_user.toggle_news
  end

  def change_calendar
  	current_user.toggle_calendar
  end


private

  def user_params
    params.require(:user).permit(:time, :weather, :zip, :origin_location, :destination_location, :mode, :transit_mode, :maps, :news)
  end

	def pub_nub_job
		$pubnub.publish( channel: current_user.channel, message: { action: true, url: "https://awakenapp.herokuapp.com/users/#{current_user.id}/widgets" }) do |envelope|
				puts envelope.status
			end
		sleep (60) # CHANGE THIS TIME
		$pubnub.publish( channel: current_user.channel, message: { action: false }) do |envelope|
				puts envelope.status
			end
	end

	def date_time

		usertime = current_user.time.to_s.split(" ")[1]
		zone = "Pacific Time (US & Canada)"
		datetime = ActiveSupport::TimeZone[zone].parse(params[:date] + " " + usertime)

		Time.zone = "Greenwich"
		datetime = datetime.in_time_zone.strftime("%Y-%m-%d %H:%M")
		datetime
	end

	# def see_google_calendar
 #        @calendar = GoogleCalWrapper.configure_client(current_user)
 #        @calendar.calendar_see(current_user)
 #    end

end
