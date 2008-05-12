class DateRange
  
  attr_accessor :start_date, :end_date, :impressions, :clicks
  
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    @impressions = 0
    @clicks = 0
  end
  
  def date
    @start_date
  end
  
  def short_date
    @start_date.strftime("%e")
  end
  
end