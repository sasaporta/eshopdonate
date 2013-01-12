class AddImgUrlAndImgAltToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :img_url, :string
    add_column :merchants, :img_alt, :string
  end
end
