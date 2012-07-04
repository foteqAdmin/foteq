# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Foteq::Application.initialize!

Encoding.default_external = "UTF-8"

=begin
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings =
{
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'ruben.ochiavone@bct.ect.ufrn.br',
  :password             => 'chi4v0n3',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
=end
