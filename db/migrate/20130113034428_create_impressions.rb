class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :link

      t.timestamps
    end
  end
end
