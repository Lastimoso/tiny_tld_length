# TinyTldLength

TinyTldLength allows you to get the correct subdomains and domain of a host, parsing it against the Public Suffix List. Get all domains rigth (not only co.uk and other usual suspects). It keeps a cached version of the list to avoid an online verification with every request. Our focus is keep it ultra-light as it would be often used with every request (For instance, to get the correct subdomain in a multi-tenant app).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiny_tld_length'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiny_tld_length

## Usage

Extra Simple API:

ttl = TinyTldLength.new

ttl.tld_length('foo.domain.co.uk') # >> 2

ttl.domain('sub1.sub2.domain.com.ar') # >> 'domain.com.ar'

ttl.subdomain('sub1.sub2.domain.com.ar') # >> 'sub1', subdomain returns the first subdomain if many

ttl.subdomains('sub1.sub2.domain.com.ar') # >> ['sub1','sub2']

## Configuration

By default it keeps the list cached locally 24hs in the /tmp folder.

You can specify a local personalized list (as along as you follow Public Suffix List directives) and pass it to the initialize method:

TinyTldLength.new(list_url: './mylist.dat')

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tiny_tld_length. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TinyTldLength project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tiny_tld_length/blob/master/CODE_OF_CONDUCT.md).
