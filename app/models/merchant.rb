class Merchant < ActiveRecord::Base
  attr_accessible :name, :link, :img_url, :img_alt, :tracking_img, :percentage
end
