class EventMailer < ApplicationMailer
	# @bar = current_bar
	 default from: "pjkovach21@gmail.com"
	# bar_update(@current_bar)



	def event_email(eventFollower, subject, body)
		#accesible in template from controller
		@eventFollower = eventFollower
		@subject = subject
		@body = body
		@url = "http://localhost:3000/users/sign_in"
		mail(to: @eventFollower.email, subject: @subject)
	end
end