class Campaign < ActiveRecord::Base
  
  belongs_to :spot
  has_one :advertisement
  
end