module OutlookCalendar
  class UserEvents
    attr_reader :token, :start_time, :end_time, :select, :calendar_id

    def initialize(token, start_time, end_time, calendar_id = nil, select = 'Subject')
      @token = token
      @start_time = start_time
      @end_time = end_time
      @select = select
      @calendar_id = calendar_id
    end

    def call
      events
    end

    private

    def events
      ParseEventResponse.new(caller).call
    end


    def caller
      RestCaller.new('get', url, headers).call
    end

    def headers
      {
        'Authorization' => "Bearer #{token}",
        'Content-Type' => 'application/json'
      }
    end

    def url
      return "https://outlook.office.com/api/v2.0/me/calendars/#{calendar_id}/calendarview#{params}" if calendar_id.present?
      "https://outlook.office.com/api/v2.0/me/calendarview#{params}"
    end

    def params
      "?startDateTime=#{start_time}&endDateTime=#{end_time}&$select=#{select}"
    end
  end
end