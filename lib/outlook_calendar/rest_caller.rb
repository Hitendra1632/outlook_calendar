module OutlookCalendar
  class RestCaller
    attr_reader :method, :url, :headers, :params

    def initialize(method, url, headers, params = {})
      @method = method
      @url = url
      @headers = headers
      @params = params
    end

    def call
      parse_response
    end

    private

    def parse_response
      return nil unless response
      JSON.parse(response)
    end

    def response
      send(method.downcase)
    end

    def get
      RestClient.get url, headers
    end

    def post
      RestClient.post url, params, headers
    end

    def delete
      RestClient.delete url, headers
    end
  end
end