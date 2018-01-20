class CreateEventParams
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    event_attributes
  end

  private

  def event_attributes
    {
      Subject: params[:subject],
      Body: {
        ContentType: params[:content_type],
        Content: 'params[:content]'
      },
      Start: {
        DateTime: params[:start_time],
        TimeZone: params[:timezone]
      },
      End: {
        DateTime: params[:end_time],
        TimeZone: params[:timezone]
      },
      Attendees: attendees
    }
  end

  def attendees
    attendees = []
    params[:attendees].each do |attendee|
      attendees.push(attendees_attributes(attendee))
    end
  end

  def attendees_attributes(attendee)
    {
      EmailAddress: {
        Address: attendee[:email],
        Name: attendee[:name]
      },
      Type: 'Required'
    }
  end

end


