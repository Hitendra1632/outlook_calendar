class ParseEventResponse
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def call
    parse_response
  end

  private

  def parse_response
    attributes
  end

  def attributes
    {
      content: response['@odata.context'],
      events: events
    }
  end

  def values
    response['values']
  end

  def events
    events = []
    values.to_a.each do |value|
      events.push(event_attributes(value))
    end
    events
  end

  def event_attributes(value)
    {
      id: value['Id'],
      url: value['@odata.id'],
      etag: value['@odata.etag'],
      subject: value['Subject'],
      start: parse_time(value['Start']),
      end:  parse_time(value['End'])
    }
  end

  def parse_time(time_value)
    { date_time: time_value['DateTime'], time_zone: time_value['TimeZone'] }
  end

end