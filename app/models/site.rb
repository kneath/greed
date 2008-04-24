class Site < ActiveRecord::Base
  
  has_many :spots
  
  validates_presence_of :name, :domain
  validates_uniqueness_of :domain
  
end