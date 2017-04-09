class UsersController < ApplicationController

	def show
	  @user = current_user
	end

  def update
    @user = current_user.update(user_params)

    respond_to do |format|
        AlarmQueue.perform_now(@user.id)
        render text: "ALARM SETTING HAS BEEN ADDED TO THE QUEUE"
        # format.html { redirect_to @user, notice: 'Alarm was successfully updated.' }
        # format.json { render :show, status: :created, location: @user }
    end
  end

end


private 

def user_params
  params.require(:user).permit(:time)
end