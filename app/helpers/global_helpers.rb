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
    
  end
end
