class Campaign < ActiveRecord::Base
  
  belongs_to :spot
  has_one :advertisement, :dependent => :destroy
  
  validates_presence_of :name, :starts_on, :ends_on, :spot_id
  
end