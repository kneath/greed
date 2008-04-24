require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Campaigns, "index action" do
  before(:each) do
    dispatch_to(Campaigns, :index)
  end
end