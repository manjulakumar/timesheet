class Notifier < ActionMailer::Base
  default from: "manjula.meera@gmail.com"

  def welcome_email(user)
	  	@user = user
    	@url  = "http://localhost:3000/timesheets"
    	mail(:to => user.email, :subject => "Welcome to My Awesome Site")
 	 end
 	
end
