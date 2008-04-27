class Impression < ActiveRecord::Base
  
  belongs_to :campaign, :counter_cache => true
  
  def click
    self.clicked = true
    self.save
    self.campaign.clicks_count += 1
    self.campaign.save
  end
  
end