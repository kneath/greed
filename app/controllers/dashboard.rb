class Dashboard < Application
  
  before :authenticate
  
  def index
    @days = Report.days_from_range(Date.today - 30, Date.today)
    render
  end
  
end