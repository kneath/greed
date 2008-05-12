module Merb
    module DashboardHelper
      def google_bar_graph(collection, x_method, y_method, options = {})
        options[:size] ||= "580x200"
        options[:color] ||= "c6d9fd"
        
        max = collection.max{ |a,b| a.send(y_method) <=> b.send(y_method) }.send(y_method)
        labels = []
        collection.each do |item|
          labels << item.send(x_method)
        end
        
        query = "http://chart.apis.google.com/chart?cht=bvs&chs=#{options[:size]}&chco=#{options[:color]}"
        query << "&chd=t:" + collection.collect{|d| d.send(y_method) }.join(",")
        query << "&chds=0,#{max}"
        query << "&chxt=x,y"
        query << "&chxl=0:|#{labels.join('|')}|1:|0|#{number_with_delimiter max/4}|#{number_with_delimiter max*2/4}|#{number_with_delimiter max*3/4}|#{number_with_delimiter max}"
        query << "&chg=" + [5000, 25, 1, 3].join(',')
        '<img src="' + query + '" alt="Graph" />'
      end
      
      def ctr(clicks, impressions)
        num = clicks.to_f/impressions.to_f*100
        num = 0 if num.nan?
        number_to_percentage(num, :precision => 2)
      end
    end
end