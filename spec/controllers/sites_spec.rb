require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Sites, "index action" do
  before(:each) do
    dispatch_to(Sites, :index)
  end
end