class Spot < ActiveRecord::Base
  
  belongs_to :site
  has_many :campaigns
  
  validates_presence_of :name
  validates_numericality_of :price
  validates_uniqueness_of :name, :scope => :site_id
  
  cattr_accessor :pricing_types
  @@pricing_types = ["CPM", "CPC", "Monthly"]
  
end