module Merb
  module GlobalHelpers
    
    # sets and spits out the page title
    # in a view: <% page_title("Add an account") %>
    # to output: <%= page_title %>
    def page_title(title = nil)
      @page_title = title unless title.nil?
      out = "Greed"
      out << " / " + @page_title unless @page_title.nil?
      return out
    end
    
    def to_percentage(fraction)
      (fraction*100).to_s + "%"
    end
    
    def host_with_port
      request.protocol + request.host
      #"http://" + Merb.config[:host] + ":" + Merb.config[:port]
    end
    
    def format_for_javascript(body)
      body.gsub(/\'/, "&apos;").gsub(/\n/, "").gsub(/\r/, "")
    end
    
    def destroy_button(url, text)
      "<form action=\"#{url}\" method=\"post\" class=\"destroy\"><button type=\"submit\" class=\"destroy\">#{text}</button></form>"
    end
    
  end
end
