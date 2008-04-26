require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Site do
  
  before(:each) do
    Site.destroy_all
    Spot.destroy_all
    Campaign.destroy_all
    
    @example_site = Site.create(valid_site_params)
    spot = Spot.create(valid_spot_params(:campaign_limit => 4))
    @example_site.spots << spot
    spot.campaigns << Campaign.create(valid_campaign_params)
  end

  it "should count campaigns allowed" do
    @example_site.campaigns_allowed.should == 4
  end
  
  it "should count campaigns filled" do
    @example_site.campaigns_filled.should == 1
  end
  
  it "should calculate the saturation" do
    @example_site.saturation.should == 0.25
  end

end