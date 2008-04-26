require File.join( File.dirname(__FILE__), "..", "spec_helper" )


describe Spot do
  
  before(:each) do
    Spot.destroy_all
  end
  
  describe "with active campaigns" do
    
    it "should have specs"
    
  end

  describe "without active campaigns" do
    
    it "should return false on campaign_for" do
      spot = Spot.create(valid_spot_params)
      spot.campaign_for(1).should == false
      spot.campaign_for(8).should == false
    end
    
  end
  
end