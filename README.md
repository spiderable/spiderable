# Spiderable

Adds support for rails applications. (Visit http://www.spiderable.org if you don't have an account)

## Installation

Add this line to your application's Gemfile:

    gem 'spiderable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spiderable

## Usage

Add a configuration file (config/spiderable.rb):

    Spiderable::Config.token = '[YOUR TOKEN]'

Thats it! To test it out, visit a url with ?_escaped_fragment_= at the end. 

    http://mysite.com?_escaped_fragment_=

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
