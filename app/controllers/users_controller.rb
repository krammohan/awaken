class UsersController < ApplicationController

	def show
	  @user = current_user
	  cal = Google::Calendar.new
	  cal.authorization = @user
	end

end