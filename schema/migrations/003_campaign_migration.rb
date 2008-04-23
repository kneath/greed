class CampaignMigration < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.integer :weight
      t.integer :impression_limit
      t.datetime :starts_on
      t.datetime :ends_on
      t.integer :spot_id
      t.timestamps
    end 
  end

  def self.down
    drop_table :campaigns
  end
end
