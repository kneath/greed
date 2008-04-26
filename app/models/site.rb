class Site < ActiveRecord::Base
  
  has_many :spots
  
  validates_presence_of :name, :url
  validates_uniqueness_of :url
  
  # the fraction of campaigns filled for how many campaigns are available
  def saturation
    self.campaigns_filled.to_f/self.campaigns_allowed.to_f
  end
  
  # number of campaigns allowed throughout the spots
  def campaigns_allowed
    ret = 0
    self.spots.each do |spot|
      ret += spot.campaign_limit
    end
    return ret
  end
  
  # number of campaigns currently running in the spots
  def campaigns_filled
    ret = 0
    self.spots.each do |spot|
      ret += spot.campaigns.count
    end
    return ret
  end
  
end