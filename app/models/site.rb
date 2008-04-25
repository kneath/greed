class Site < ActiveRecord::Base
  
  has_many :spots
  
  validates_presence_of :name, :url
  validates_uniqueness_of :url
  
  # the fraction of campaigns filled for how many campaigns are available
  def saturation
    0.75
  end
  
end