class VolunteerMailer < ActionMailer::Base

  default from: Rails.application.secrets.default_email_sender

  def send_email(mail_address, options = {})
    @message = options[:message]
    mail(from: options[:sender].presence || Rails.application.secrets.default_email_sender, to: mail_address, subject: options[:subject])
  end
end
