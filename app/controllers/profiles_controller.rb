class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_profile
	
	def show
		@the_user = User.find(params[:id])
		@user_profile = @the_user.profile
	end
	def edit

	end
	def update
		if @profile.update(profile_params)
			redirect_to @profile, notice: 'Profile updated successfully'
		else
			render 'edit'
		end
	end

	private

	def find_profile
		@profile = Profile.find(current_user.profile.id)		
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :phone, :email, :address)
	end
end