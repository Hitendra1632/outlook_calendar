class CreateEvent
  attr_reader :token, :calendar_id, :params, :select

  def initialize(token, calendar_id, params, select = {})
    @token = token
    @calendar_id = calendar_id
    @params = params
    @select = select
  end

  def call
    create_event
  end

  private

  def create_event
    caller
  end

  def event_attributes
    CreateEventParams.new(params).call
  end

  def caller
    RestCaller.new('post', url, headers, event_attributes).call
  end

  def headers
    {
      'Authorization' => "Bearer #{token.token}",
      'Content-Type' => 'application/json'
    }
  end

  def calendar?
    calendar_id.present?
  end

  def url
    return "https://outlook.office.com/api/v2.0/me/events#{params}" if calendar?
    'https://outlook.office.com/api/v2.0/me/events'
  end

  def params
    "?$Select=#{select}"
  end

end