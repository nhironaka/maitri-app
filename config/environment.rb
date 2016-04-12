# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
if Rails.env.development?
    ActionMailer::Base.delivery_method = :sendmail
end
