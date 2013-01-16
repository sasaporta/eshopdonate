class ContactMailer < ActionMailer::Base
  default from: "contact@buydonate.com"

  def contact_email()
    mail(to: "saporta98@yahoo.com", subject: "This is a test message")
  end

end
