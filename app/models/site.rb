class Site < ActiveRecord::Base
  
  has_many :spots
  
  validates_presence_of :name, :url
  validates_uniqueness_of :url
  
end