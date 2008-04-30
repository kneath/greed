class Dashboard < Application
  
  before :authenticate
  
  def index
    render
  end
  
end