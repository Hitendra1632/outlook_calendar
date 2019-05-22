module OutlookCalendar
  class Calenders
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def call
      calenders
    end

    private

    def calenders
      ParseCalendarResponse.new(caller).call
    end

    def caller
      RestCaller.new('get', url, headers).call
    end

    def headers
      {
        'Authorization' => "Bearer #{token}",
        'Accept' => 'application/json'
      }
    end

    def url
      @url = 'https://outlook.office.com/api/v2.0/me/calendars'
    end
  end
end
