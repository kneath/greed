class SpotMigration < ActiveRecord::Migration
  def self.up
    create_table :spots do |t|
      t.string :name
      t.float :price
      t.string :pricing_type
      t.integer :campaign_limit
      t.integer :site_id
      t.timestamps
    end 
  end

  def self.down
    drop_table :spots
  end
end