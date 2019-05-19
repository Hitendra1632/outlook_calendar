# Outlook Calendar

The Outlook calendar gem is a api implementation of the Calendar APIs. It provides basic CRUD functionality for Outlook calendar.


Rails gem for outlook calendar integration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'outlook_calendar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install outlook_calendar

## Usage

To get a user access token
```ruby
OutlookCalendar::AccessToken.new(code, client_id, client_secret, scope, redirect_uri).call
```

To refresh a user access token
```ruby
OutlookCalendar::RefreshToken.new(refresh_token, client_id, client_secret, scope, redirect_uri).call
```

To get calendars
```ruby
OutlookCalendar::Calenders.new(token).call
```

To get events
```ruby
params = {
  'startDateTime'=> from_date,
  'endDateTime'=> to_date,
  '$select'=> 'Subject,Start,End', # 'Subject' by default
  '$top'=> 1000
}
OutlookCalendar::UserEvents.new(token, params, selected_calendar)
```

To create an event
```ruby
params = {
  title: '',
  start_time: '',
  end_time: '',
  timezone: '',
  content_type: '',
  content: '',
  Attendees: [{ email: '', name: '' }]
}
OutlookCalendar::CreateEvent.new(token, calendar_id, params, select).call
```

To delete an event
```ruby
OutlookCalendar::DeleteEvent.new(token, event_id).call
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Hitendra1632/outlook_calendar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the OutlookCalendar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Hitendra1632/outlook_calendar/blob/master/CODE_OF_CONDUCT.md).

## Release Notes

version 0.1.6, Remove issue of double creation of event.

version 0.1.7, Fix the response for event deletion.

version 0.1.9, Add more params for getting events.

version 0.2.0, Upgrade to new auth APIs.

## To Do

Upgrade to Graph APIs.
