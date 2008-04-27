class ImpressionMigration < ActiveRecord::Migration
  def self.up
    create_table :impressions do |t|
      t.string :ip
      t.string :country
      t.boolean :clicked, :default => false
      t.integer :campaign_id
      t.datetime :created_at
    end
    add_column :campaigns, :impressions_count, :integer, :default => 0
    add_column :campaigns, :clicks_count, :integer, :default => 0
  end

  def self.down
    drop_table :impressions
  end
end