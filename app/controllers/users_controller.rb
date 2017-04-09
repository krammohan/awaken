class UsersController < ApplicationController

	def show
	  @user = current_user
	end

  def update
		p "*" * 50
		p user_params
		p "*" * 50
		p params
    update_status = current_user.update(user_params)
		flash.notice = "ALARM UPDATED THO"

    respond_to do |format|
        AlarmQueue.perform_now(current_user.id)
        # render text: "ALARM SETTING HAS BEEN ADDED TO THE QUEUE"
        format.html { redirect_to current_user, notice: 'Alarm was successfully updated.' }
        format.json { render :show, status: :created, location: current_user }
    end
  end

end


private

def user_params
  params.require(:user).permit(:time, :weather)
end
