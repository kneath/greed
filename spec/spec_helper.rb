require 'rubygems'
require 'merb-core'
require 'spec' # Satiates Autotest and anyone else not using the Rake tasks

Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test')

Spec::Runner.configure do |config|
  config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
end

def valid_site_params(options = {})
  {:name => "Example Site", :url => "http://example.com"}.merge(options)
end

def valid_spot_params(options = {})
  {:name => "Example Spot", :price => 50.0, :pricing_type => "Monthly", :campaign_limit => 2}.merge(options)
end

def valid_campaign_params(options ={})
  {:name => "Example Campaign", :weight => 1.0, :starts_on => "2008-04-05 00:00:00", :ends_on => "2008-05-05 00:00:00"}
end