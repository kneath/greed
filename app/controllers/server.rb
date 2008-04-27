# Responsible for serving the ads (public facing)
class Server < Merb::Controller
  
  def spot
    @spot = Spot.find(params[:id])
    @campaign = @spot.campaign_for_serving
    render_then_call(render partial("shared/ad"), :layout => false) do
      geo_ip = GeoIP.new(Merb.root / "data" / "GeoLiteCity.dat")
      geo_ip_data = geo_ip.city(request.remote_ip)
      impression = @campaign.impressions.create(:ip => request.remote_ip, :country => geo_ip_data[5])
    end
  end
  
  def click
    @impression = Impression.find(params[:id])
    @impression.click
    return nil
  end
  
end
