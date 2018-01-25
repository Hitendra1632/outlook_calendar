module OutlookCalendar
  class ParseCalendarResponse
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
        calendars: calendars
      }
    end

    def values
      response['value']
    end

    def calendars
      calenders = []
      values.to_a.each do |value|
        calenders.push(calendar_attributes(value))
      end
      calenders
    end

    def calendar_attributes(value)
      {
        id: value['Id'],
        url: value['@odata.id'],
        name: value['Name'],
        change_key: value['ChangeKey'],
        color: value['Color'],
        can_share: value['CanShare'],
        can_view_private_items: value['CanViewPrivateItems'],
        CanEdit: value['CanEdit'],
        owner: owner(value['Owner'])
      }
    end

    def owner(owner_value)
      return [] if owner_value.present?
      { name: owner_value['Name'], address: owner_value['Address'] }
    end
  end
end