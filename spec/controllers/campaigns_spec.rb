require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Campaigns do
  before(:each) do
    dispatch_to(Campaigns, :index)
  end
  
  it "should redirect on index"
  
  it "should select a default site if no site is selected"
  
  it "should remember your last selection from cookies"
  
end