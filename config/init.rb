# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

# Make the app's "lib" directory a place where ruby files get "require"d from
$LOAD_PATH.unshift(Merb.root / "lib")


Merb::Config.use do |c|
  
  ### Sets up a custom session id key, if you want to piggyback sessions of other applications
  ### with the cookie session store. If not specified, defaults to '_session_id'.
  # c[:session_id_key] = '_session_id'
  
  c[:session_store] = 'none'
end  

### Merb doesn't come with database support by default.  You need
### an ORM plugin.  Install one, and uncomment one of the following lines,
### if you need a database.
use_orm :activerecord

### This defines which test framework the generators will use
use_test :rspec

### Add your other dependencies here

dependencies "merb-assets", "merb_helpers"

Merb::BootLoader.after_app_loads do    
  my_formats = {
    :admin => '%m/%d/%y %I%p',
    :general => '%b %d, %Y',
    :sitemap => "%Y-%m-%d"
  }
  ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(my_formats)
  ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(my_formats)
end