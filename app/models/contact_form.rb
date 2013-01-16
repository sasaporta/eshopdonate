class ContactForm < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject

  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
end
