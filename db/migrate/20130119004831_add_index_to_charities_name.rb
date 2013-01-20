class AddIndexToCharitiesName < ActiveRecord::Migration
  def change
    add_index :charities, :url, unique: true
  end
end
