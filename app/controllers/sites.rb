class Sites < Application
  
  def index
    @sites = Site.find(:all)
    render
  end
  
  def create
    @site = Site.new(params[:site])
    return render unless request.method == :post
    if @site.save
      redirect url(:action => "index")
    end
    render
  end
  
end