# Rebot

Rebot is a framework for building bots application.

## Getting started

Create new app

    $ gem install rebot
    $ rebot new my_bot

Create new slack bot integration at (http://slack.com/services)[http://slack.com/services] and copy token.

    $ cd my_bot
    $ TOKENS=token-your-copied-from-slack ./server

Text `hi` to your new bot.

## Usage

Rebot uses `conversations` to enable developers create complex text interactions.

```ruby
hears /^(hi|hello)/i do
  start_conversation do
    say "Hi!"
    say "How are you doing?"
    say "Do you have any plans for a weekend?"
    
    hears yes do
      say "Nice! Hope you have a great weekend!"
    end
    
    hears no do
      say "Oh! Do you want to play with `rebot` framework?"
      say "Check it out at https://github.com/keydunov/rebot"
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rebot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

