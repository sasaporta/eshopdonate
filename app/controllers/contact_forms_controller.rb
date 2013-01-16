class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    ContactMailer.contact_email.deliver    
  end
end
