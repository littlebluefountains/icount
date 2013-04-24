# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Icount2::Application.initialize!

Icount2::Application.configure do
	config.action_mailer.delivery_method = :smtp

	config.action_mailer.smtp_settings = {
		address: "smtp.gmail.com",
		port: 587,
		domain: "icountng.com",
		authentication: "plain",
		user_name: "icukaegbu@gmail.com",
		password: "ikedi2012Chibueze",
		enable_starttls_auto: true
	}
end
