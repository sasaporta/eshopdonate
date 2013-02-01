class AddShortnameToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :shortname, :string
  end
end
