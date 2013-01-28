class Charity < ActiveRecord::Base
  attr_accessible :name, :url

  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, length: { maximum: 200 }
end
