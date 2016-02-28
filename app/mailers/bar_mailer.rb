class BarMailer < ApplicationMailer
	# @bar = current_bar
	 default from: "pjkovach21@gmail.com"
	# bar_update(@current_bar)



	def bar_email(barFollower, subject, body)
		#accesible in template from controller
		@barFollower = barFollower
		@subject = subject
		@body = body
		@url = "http://localhost:3000/users/sign_in"
		mail(to: @barFollower.email, subject: @subject)
	end
end
