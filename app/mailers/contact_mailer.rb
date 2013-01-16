class ContactMailer < ActionMailer::Base
  # todo - don't hardcode "fron" adress
  default from: "contact@buydonate.com"

  def contact_email(contact_form)
    @contact_form = contact_form
    # todo - don't hardcode "to" address
    mail(to: "saporta98@yahoo.com", subject: "Contact request")
  end
end
