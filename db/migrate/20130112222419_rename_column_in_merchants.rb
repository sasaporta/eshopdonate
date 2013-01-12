class RenameColumnInMerchants < ActiveRecord::Migration
  def up
    rename_column :merchants, :url, :link
  end

  def down
    rename_column :merchants, :link, :url
  end
end
