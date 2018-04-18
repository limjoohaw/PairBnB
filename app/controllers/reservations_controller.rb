class ReservationsController < ApplicationController
	before_action :check_user
	
	# def index
	# 	@reservation = Reservations.all		
	# end

	def create
		@reservation = Reservation.new
		@reservation = current_user.reservations.new(allowed_params)
		@reservation.listing_id = params[:listing_id]
		@notice = "Date not available"
		# NewUserEmailMailer.notify(current_user.email).deliver_now
		if @reservation.save
				redirect_to braintree_new_path(@reservation.id)
		else
			flash[:alert] = @notice
			@listing = @reservation.listing
			render "listings/show"
		end
	end

	private

	def allowed_params
		params.require(:reservation).permit(:date_in, :date_out)
	end

	def check_user
		if
			signed_in?
		else
			@notice = "Please sign in before make reservation"
			redirect_to sign_in_path, :alert => @notice
		end
	end
end