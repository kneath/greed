class Report
  
  def self.days_from_range(start_date, end_date)
    raise TypeError("Expected Date, got #{start_date.class.to_s}") unless start_date.is_a?(Date)
    raise TypeError("Expected Date, got #{end_date.class.to_s}") unless end_date.is_a?(Date)
        
    stats = {}
    raw_stats = Impression.find_by_sql("SELECT DATE_FORMAT(created_at, \"%Y%j\") AS day_index, created_at, COUNT(*) AS impressions, SUM(clicked) AS clicks FROM impressions WHERE created_at > '#{start_date.to_formatted_s(:db)}' AND created_at < '#{end_date.to_formatted_s(:db)}' GROUP BY day_index")
    raw_stats.each do |stat|
      stats[stat.day_index.to_s] = stat
    end
    
    days = []
    current_date = start_date
    while (current_date < end_date) do
      day = DateRange.new(current_date.to_time, (current_date + 1.day).to_time)
      stat = stats[current_date.year.to_s + current_date.yday.to_s]
      day.impressions, day.clicks = stat["impressions"].to_i, stat["clicks"].to_i unless stat.nil?
      days << day
      current_date += 1
    end
    days.reverse
  end
  
end