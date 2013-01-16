class ContactMailer < ActionMailer::Base
  default from: "contact@buydonate.com"

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(to: "saporta98@yahoo.com", subject: "Contact request")
  end

end
