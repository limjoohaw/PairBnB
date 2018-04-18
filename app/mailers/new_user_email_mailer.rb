class NewUserEmailMailer < ApplicationMailer
	
	def notify(current_user)
		mail(:to => current_user, :subject => "Seabnb - Booking confirmation")
	end

end
