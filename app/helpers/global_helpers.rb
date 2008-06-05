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
      body.gsub(/\'/, "&apos;").gsub(/\n/, "").gsub(/\r/, "").gsub(/\t/, "").gsub(/ +/, " ")
    end
    
    def destroy_button(url, text)
      "<form action=\"#{url}\" method=\"post\" class=\"destroy\"><button type=\"submit\" class=\"destroy\">#{text}</button></form>"
    end
    
    # Formats a +number+ with grouped thousands using +delimiter+ (e.g., 12,324). You
    # can customize the format using optional <em>delimiter</em> and <em>separator</em> parameters.
    #
    # ==== Options
    # * <tt>delimiter</tt>  - Sets the thousands delimiter (defaults to ",").
    # * <tt>separator</tt>  - Sets the separator between the units (defaults to ".").
    #
    # ==== Examples
    #  number_with_delimiter(12345678)       # => 12,345,678
    #  number_with_delimiter(12345678.05)    # => 12,345,678.05
    #  number_with_delimiter(12345678, ".")  # => 12.345.678
    #
    #  number_with_delimiter(98765432.98, " ", ",")
    #  # => 98 765 432,98
    def number_with_delimiter(number, delimiter=",", separator=".")
      begin
        parts = number.to_s.split('.')
        parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
        parts.join separator
      rescue
        number
      end
    end
    
    # Formats a +number+ as a percentage string (e.g., 65%). You can customize the
    # format in the +options+ hash.
    #
    # ==== Options
    # * <tt>:precision</tt>  - Sets the level of precision (defaults to 3).
    # * <tt>:separator</tt>  - Sets the separator between the units (defaults to ".").
    #
    # ==== Examples
    #  number_to_percentage(100)                         # => 100.000%
    #  number_to_percentage(100, :precision => 0)        # => 100%
    #
    #  number_to_percentage(302.24398923423, :precision => 5)
    #  # => 302.24399%
    def number_to_percentage(number, options = {})
      options   = options.stringify_keys
      precision = options["precision"] || 3
      separator = options["separator"] || "."

      begin
        number = number_with_precision(number, precision)
        parts = number.split('.')
        if parts.at(1).nil?
          parts[0] + "%"
        else
          parts[0] + separator + parts[1].to_s + "%"
        end
      rescue
        number
      end
    end
    
    # Formats a +number+ with the specified level of +precision+ (e.g., 112.32 has a precision of 2). The default
    # level of precision is 3.
    #
    # ==== Examples
    #  number_with_precision(111.2345)     # => 111.235
    #  number_with_precision(111.2345, 2)  # => 111.23
    #  number_with_precision(13, 5)        # => 13.00000
    #  number_with_precision(389.32314, 0) # => 389
    def number_with_precision(number, precision=3)
      "%01.#{precision}f" % ((Float(number) * (10 ** precision)).round.to_f / 10 ** precision)
    rescue
      number
    end
    
  end
end
