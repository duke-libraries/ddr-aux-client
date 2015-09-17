# DdrAux::Client

A client library for [ddr-aux](https://github.com/duke-libraries/ddr-aux) web services.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ddr-aux-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ddr-aux-client

## Usage

See [API](https://github.com/duke-libraries/ddr-aux-client/wiki/API).

Configure the ddr-aux API URL via the `DDR_AUX_API_URL` environment variable, or by using the attribute setter:

```ruby
DdrAux::Client.api_url = "http://localhost:3000/api"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ddr-aux-client.

