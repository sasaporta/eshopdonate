class AddPercentageToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :percentage, :decimal
  end
end
