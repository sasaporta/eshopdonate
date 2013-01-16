class ContactForm < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject
end
