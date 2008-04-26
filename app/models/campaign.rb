class Campaign < ActiveRecord::Base
  
  belongs_to :spot
  
  validates_presence_of :name, :starts_on, :ends_on, :spot_id
  
end