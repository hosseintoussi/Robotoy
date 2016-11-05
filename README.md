[![Build Status](https://travis-ci.org/hosseintoussi/robotoy.svg?branch=master)](https://travis-ci.org/hosseintoussi/robotoy)
[![Gem Version](https://badge.fury.io/rb/robotoy.svg)](https://badge.fury.io/rb/robotoy)
[![Code Climate](https://codeclimate.com/github/hosseintoussi/robotoy/badges/gpa.svg)](https://codeclimate.com/github/hosseintoussi/robotoy)
[![Test Coverage](https://codeclimate.com/github/hosseintoussi/robotoy/badges/coverage.svg)](https://codeclimate.com/github/hosseintoussi/robotoy/coverage)
# Robotoy
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

## Installation

Install it yourself with:

    $ gem install robotoy

## Usage

After installation you can run the app by passing a file of commands( a sample file is provided in this repo `commands.txt`) to `robotoy` in terminal:

```
robotoy path/to/commands.txt
```

## Development

Run `rspec` to run the tests. You can also run `rake console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hosseintoussi/robotoy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

