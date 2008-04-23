class Spot < ActiveRecord::Base
  
  belongs_to :site
  has_many :campaigns
  
end