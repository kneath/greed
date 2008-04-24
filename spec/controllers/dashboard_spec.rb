require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Dashboard, "index action" do
  before(:each) do
    dispatch_to(Dashboard, :index)
  end
end