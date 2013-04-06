module Spiderable
  module Crawler
    extend self

    def urlFromRack(environment)
      url = []
      url << environment['rack.url_scheme'] + '://'
      url << environment['HTTP_HOST']
      url << environment['REQUEST_PATH']
      url << '?' unless environment['QUERY_STRING'].starts_with? '_escaped_fragment_'
      url << environment['QUERY_STRING'].gsub(/(\&)?_escaped_fragment_=/, '')

      url.join ''
    end

    def urlFromUrl(url)
      url.gsub(/[\?\&]_escaped_fragment_=/, '')
    end
  end

  module Railtie
    class Middleware
      def initialize(application)
        @application = application
      end

      def call(environment)
        is_bot = environment["HTTP_USER_AGENT"].match(/\(.*https?:\/\/.*\)/) ||
                  environment['QUERY_STRING'].include?("_escaped_fragment_")

        if is_bot
          url  = Crawler.urlFromRack(environment)
          html = Connect.get_url_contents(url) rescue "FAIL\n"

          if html == "FAIL\n"
            @application.call(environment)
          else
            [200, {"Content-Type" => "text/html; charset=utf-8"}, [html]]
          end
        else
          @application.call(environment)
        end
      end
    end
  end
end