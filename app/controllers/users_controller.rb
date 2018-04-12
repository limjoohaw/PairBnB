class UsersController < Clearance::UsersController
	before_action :check_owner, only: :update

	
	# def show
	# 	@user = current_user
	# end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if params[:_remove_picture] == "1"
			@user.avatar = nil
		end
		@user.update_attributes(allowed_params)
		@next = edit_user_path
		@notice = "Update Successful"

		redirect_to @next, :notice => @notice
	end

	private
	def allowed_params
		params.require(:user).permit(:avatar)
	end

	def check_owner
		if current_user.id != params[:id]
		else
		  redirect_to edit_user_path(current_user) 
		end	
	end
end
