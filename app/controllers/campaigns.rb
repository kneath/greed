class Campaigns < Application
  
  def index
    unless cookies[:selected_site_id].nil?
      @site = Site.find(cookies[:selected_site_id])
    else
      @site = Site.find(:first)
    end
    redirect url(:action => "show", :site_id => @site.id)
  rescue
    redirect url(:controller => "sites", :action => "index")
  end
  
  def show
    @sites = Site.find(:all)
    @site = Site.find(params[:site_id])
    @campaign = Campaign.new(params[:campaign])
    cookies[:selected_site_id] = params[:site_id]
    if request.method == :post or request.method == :put
      @campaign = Campaign.new(params[:campaign].merge({:active => true}))
      if @campaign.save
        @campaign = Campaign.new
      end
      @site.reload
    end
    render
  end
  
  def edit
    @sites = Site.find(:all)
    @campaign = Campaign.find(params[:id])
    @site = @campaign.spot.site
    @campaign.update_attributes(params[:campaign]) if request.method == :post or request.method == :put
    render
  end
  
end
