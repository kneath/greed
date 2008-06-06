# Responsible for serving the ads (public facing)
class Server < Merb::Controller
  
  def spot
    @spot = Spot.find(params[:id])
    @campaign = @spot.campaign_for_serving
    return render "/* No campaign available */", :layout => false, :format => :js if @campaign.nil?
    render_then_call(render(:layout => false, :format => :js)) do
      geo_ip = GeoIP.new(Merb.root / "data" / "GeoLiteCity.dat")
      geo_ip_data = geo_ip.city(request.remote_ip)
      impression = @campaign.impressions.create(:ip => request.remote_ip, :country => geo_ip_data[5])
    end
  end
  
  def click
    campaign = Campaign.find(params[:id])
    impression = campaign.impressions.find(:first, :conditions => ["ip = ?", request.remote_ip], :order => "created_at DESC")
    impression.click
    return nil
  end
  
end
