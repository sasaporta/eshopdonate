class AddTrackingImgToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :tracking_img, :string
  end
end
