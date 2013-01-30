class Charity < ActiveRecord::Base
  attr_accessible :name, :url, :amazon_tracking_id

  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, length: { maximum: 200 }
  validate :amazon_tracking_id, presence: true, length: { maximum: 50 }
end
