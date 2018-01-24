module OutlookCalendar
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
        Subject: params[:title],
        Body: {
          ContentType: params[:content_type],
          Content: params[:content]
        },
        Start: {
          DateTime: params[:start_time],
          TimeZone: timezone
        },
        End: {
          DateTime: params[:end_time],
          TimeZone: timezone
        },
        Attendees: attendees
      }
    end

    def timezone
      return '' unless params[:content_type].present?
      params[:timezone]
    end

    def content_type
      return 'HTML' unless params[:content_type].present?
      params[:content_type]
    end

    def content
      return '' unless params[:content].present?
      params[:content]
    end

    def type
      return 'Required' unless params[:type].present?
      params[:type]
    end

    def attendees
      return [] unless params[:attendees].present?
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
end


