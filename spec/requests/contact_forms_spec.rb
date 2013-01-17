require 'spec_helper'

describe "ContactForms" do
  it "should have the title 'Contact'" do
    visit contact_path
    page.should have_selector('title', text: "Contact")
  end

  it "should generate an email message" do
    @contact_form = ContactForm.new(name: "Joe Schmo", email: "joe@example.com", subject: "Example subject", body: "This is a test")
    @email = ContactMailer.contact_email(@contact_form).deliver
    ActionMailer::Base.deliveries.should_not be_empty
    @email.encoded.should have_content("Name: Joe Schmo")
    @email.encoded.should have_content("Email: joe@example.com")
    @email.encoded.should have_content("Subject: Example subject")
    # todo - test for conversion of newline to BR tag in message body
    @email.encoded.html_safe.should have_content("This is a test")
  end
end
