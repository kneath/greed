class Spot < ActiveRecord::Base
  
  belongs_to :site
  has_many :campaigns
  
  validates_presence_of :name
  validates_numericality_of :price
  validates_uniqueness_of :name, :scope => :site_id
  
  # gets a campaign for a given index and returns false if none exists
  def campaign_for(index)
    return false if self.campaigns.count < index
    return self.campaigns[index - 1]
  end
  
end