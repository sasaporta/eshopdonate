class Charity < ActiveRecord::Base
  attr_accessible :name, :url, :amazon_tracking_id, :shortname

  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, length: { maximum: 200 }
  validates :amazon_tracking_id, presence: true, length: { maximum: 50 }
  validates :shortname, presence: true, length: { maximum: 50 }
end
