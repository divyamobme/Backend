require 'action_mailer'
require 'net/smtp'
require 'active_support'

#rescue_from User::NotAuthorized, with: :deny_access # self defined exception
#rescue_from ActiveRecord::RecordInvalid, with: :show_errors
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :authentication       => :login,
   :user_name            => "moviereview2255@gmail.com",
   :password             => "admin@moviereview",
   :enable_starttls_auto => true
  }

class Mailer < ActionMailer::Base
  def awesome_email(details)
    @to     = details[:to]
    @from   = details[:from]
    subject = details[:subject]

    mail( :to      => "#{@to}",
          :from    => "#{@from}",
          :subject => subject) do |format| 
    	   format.html
    
    end                      
  end
end


details = { to: 'sjdivya03@gmail.com' , from: 'moviereview2255@gmail.com', subject: 'Welcome to Movie Review!' }

ActionMailer::Base.view_paths= File.dirname("mailer/")

email = Mailer.awesome_email( details )
email.deliver