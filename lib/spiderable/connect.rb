module Spiderable
  module Connect
    BASE_URL = 'http://www.spiderable.org'
    
    def self.get_url_contents(url)
      contents = Faraday.get("#{BASE_URL}/api/v1/pages.json?url=#{url}&token=#{Config.token}")

      if contents.status == 200
        JSON.parse(contents.body)['contents']
      else
        contents.body
      end
    end

  end
end