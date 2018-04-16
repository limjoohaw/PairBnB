class NewUserEmailMailer < ApplicationMailer
	
	def notify(current_user)
		mail(:to => current_user, :subject => "Welcome")
	end

end
