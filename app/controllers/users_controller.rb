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

		p "*" * 30
		p "Time"
		p current_user.time
		p "*" * 30
		p "*" * 30

			# Not working 100% => needs to know if it's the same day!

			$scheduler.jobs(:user_id => current_user.id).each do |job|
						p job
						p "*" * 30
					# if job.scheduled_at.includes? user.time.split(" ")[0]
					# 	job.unschedule
					# end
			end


			# Time in UTC!!!
			user_job = $scheduler.at(date_time, :user_id => current_user.id) do
				# @user.construct_widgets
				pub_nub_job
			end

			p user_job

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

	def date_time

		usertime = current_user.time.to_s.split(" ")[1]
		zone = "Pacific Time (US & Canada)"
		datetime = ActiveSupport::TimeZone[zone].parse(params[:date] + " " + usertime)

		# datetime = Time.parse(params[:date] + " " + usertime)

		Time.zone = "Greenwich"
		p "Previous datetime"
		p datetime
		p "Time zone"
		p Time.zone
		p "Date time in time zone"
		p datetime.in_time_zone

		p "Formatted shit"
		datetime.in_time_zone.strftime("%Y-%m-%d %H:%M")


		# Time.parse(params[:date] + current_user.time.strftime("%H:%M"))
    # date_parse = Date.parse(date)
    # date_format = date_parse.strftime('%Y-%m-%d')
    # date_format + " " + current_user.time.strftime("'%Y-%m-%d' %H:%M")
	end

end
