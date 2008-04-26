class CampaignMigration < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.integer :weight
      t.datetime :starts_on
      t.datetime :ends_on
      t.boolean :active
      t.string :filename
      t.integer :spot_id
      t.timestamps
    end 
  end

  def self.down
    drop_table :campaigns
  end
end
