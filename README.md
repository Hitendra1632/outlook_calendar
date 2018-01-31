# OutlookCalendar

The Outlook gem is a api implementation of the  Calendar APIs. It provides basic CRUD functionality for Outlook calendar.


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

    For getting a user access token call:
    OutlookCalendar::AccessToken.new(code, app_id, app_secret_key, scope, redirect_uri).call
    
    For getting a user refresh token 
    OutlookCalendar::RefreshToken.new(token, refresh_token, client_id, client_secret, redirect_uri).call
    
    For getting a user calendar
    OutlookCalendar::RefreshToken.new(token).call
    
    For getting calendar based event
    OutlookCalendar::RefreshToken.new(token, start_time, end_time, select, calendar_id).call
    
    default value of select = 'Subject' but you can also pass your values.
    
    For getting events
    OutlookCalendar::RefreshToken.new(token, start_time, end_time, select).call
    
    For creating a event 
    OutlookCalendar::CreateEvent.new(token, calendar_id, params, select).call
     pass the select for response same like above
     params = {title: '', start_time: '', end_time: '', timezone: '', content_type: '', content: '', Attendees: [{email: '', name: ''}]}
     
    For deleting a event
    OutlookCalendar::DeleteEvent.new(token, event_id).call


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Hitendra1632/outlook_calendar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the OutlookCalendar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Hitendra1632/outlook_calendar/blob/master/CODE_OF_CONDUCT.md).


## Bug fixes
version 0.1.6 Remove issue of double creation of event. 

version 0.1.7, fixing the response for event deletion.