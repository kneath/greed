class AdvertisementMigration < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :title
      t.text :description
      t.string :filename
      t.string :content_type
      t.integer :width
      t.integer :height
      t.integer :campaign_id
      t.timestamps
    end 
  end

  def self.down
    drop_table :advertisements
  end
end
