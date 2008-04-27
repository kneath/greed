class Spot < ActiveRecord::Base
  
  belongs_to :site
  has_many :campaigns
  has_many :active_campaigns, :class_name => "Campaign", :conditions => ["starts_on < ? AND ends_on > ? AND active = ?", Time.now.to_formatted_s(:db), Time.now.to_formatted_s(:db), true]
  
  validates_presence_of :name
  validates_numericality_of :price
  validates_uniqueness_of :name, :scope => :site_id
  
  # gets a campaign for a given index and returns false if none exists
  def campaign_for(index)
    return false if self.active_campaigns.count < index
    return self.active_campaigns[index - 1]
  end
  
  # finds an advertisment with weighting, etc taken into account
  def campaign_for_serving
    self.active_campaigns.rand
  end
  
end