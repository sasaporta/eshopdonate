class ContactForm < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject

  # todo - validate max length of all fields
  validates :name, presence: true
  # todo - validate email format as well as presence
  validates :email, presence: true
  validates :subject, presence: true
end
