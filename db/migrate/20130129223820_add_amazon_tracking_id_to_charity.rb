class AddAmazonTrackingIdToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :amazon_tracking_id, :string
  end
end
