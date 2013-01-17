class ContactForm < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 1000 }
end
