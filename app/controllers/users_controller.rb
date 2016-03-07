class UsersController < ApplicationController
	def index
		if current_user.role_id == 4
			@users = User.paginate(:page => params[:page], :per_page => 4).order("role_id DESC")
		else
			render 'restrict_access'
		end
	end
end