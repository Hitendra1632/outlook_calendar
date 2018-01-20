
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "outlook_calendar/version"

Gem::Specification.new do |spec|
  spec.name          = "outlook_calendar"
  spec.version       = OutlookCalendar::VERSION
  spec.authors       = ["hitendra"]
  spec.email         = ["hitendra1632@gmail.com"]

  spec.summary       = %q{A gem for outlook calendar}
  spec.description   = %q{A wapper for outlook calender }
  spec.homepage      = 'https://github.com/Hitendra1632/outlook_calendar'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
