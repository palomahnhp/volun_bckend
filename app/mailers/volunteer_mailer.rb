class VolunteerMailer < ActionMailer::Base

  # default from: Rails.application.secrets.default_email_sender
  default from: 'aleonmon.test@gmail.com'

  def send_email(mail_address, options = {})
    @message = options[:message]
    mail(to: mail_address, subject: options[:subject])
  end
end
