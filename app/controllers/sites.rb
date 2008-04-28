class Sites < Application
  
  def index
    @sites = Site.find(:all, :order => "created_at DESC")
    @site = Site.new(params[:site])
    return render unless request.method == :post
    if @site.save
      redirect url(:action => "index")
    end
    render
  end
  
  def edit
    @site = Site.find(params[:id])
    @spot = Spot.new(params[:spot])
    return render unless request.method == :put or request.method == :post
    @site.update_attributes(params[:site]) unless params[:site].nil?
    unless params[:spot].nil?
      @spot = @site.spots.build(params[:spot]) 
      @spot = Spot.new if @spot.save
    end
    render
  end
  
  def destroy
    @site = Site.find(params[:id])
    if request.method == :post
      @site.destroy
    end
    redirect url(:action => "index")
  end
  
  def destroy_spot
    @spot = Spot.find(params[:id])
    if request.method == :post
      @spot.destroy
    end
    redirect url(:action => "edit", :id => @spot.site.id)
  end
  
end