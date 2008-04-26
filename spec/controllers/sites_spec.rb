require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Sites do
  
  before(:each) do
    Site.destroy_all
  end
  
  it "should show index without sites" do
    controller = get url(:controller => "sites", :action => "index")
    controller.should respond_successfully
  end
  
  it "should show index with sites" do
    Site.create(valid_site_params)
    controller = get url(:controller => "sites", :action => "index")
    controller.should respond_successfully
  end
  
  it "should create a site" do
    lambda do
      post url(:controller => "sites", :action => "index"), :site => valid_site_params
    end.should change(Site, :count)
  end
  
  it "should edit a site" do
    site = Site.create(valid_site_params)
    controller = post url(:controller => "sites", :action => "edit", :id => site.id), :site => {:name => "New Name"}
    controller.should respond_successfully
    site.reload.name.should == "New Name"
  end
  
  it "should add a spot to a site" do
    site = Site.create(valid_site_params)
    lambda do
      controller = post url(:controller => "sites", :action => "edit", :id => site.id), :spot => valid_spot_params
    end.should change(Spot, :count)
  end
  
  it "should remove a spot from a site"
  
  it "should remove a site"
  
end