require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Sites do
  
  it "should create a site" do
    lambda do
      post url(:controller => "sites", :action => "create"), :site => {:name => "Example Site", :domain => "http://example.com"}
    end.should change(Site, :count)
  end
  
  it "should edit a site"
  
  it "should add a spot to a site"
  
  it "should remove a spot from a site"
  
  it "should remove a site"
  
end