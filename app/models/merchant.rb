class Merchant < ActiveRecord::Base
  attr_accessible :name, :link, :img_url, :img_alt, :tracking_img, :percentage

  validates :name, presence: true, length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :link, presence: true, length: { maximum: 200 }
  validates :img_url, presence: true, length: { maximum: 200 }
  validates :img_alt, presence: true, length: { maximum: 200 }
  validates :tracking_img, presence: true, length: { maximum: 200 }
  validates :percentage, presence: true, numericality: true, :format => { :with => /^\d{0,2}(\.?\d{0,2})?$/ }
end
