# Trading Reputation Guru

[![Build Status](https://travis-ci.org/siegy22/trading_reputation.svg?branch=master)](https://travis-ci.org/siegy22/trading_reputation)

Community app to track your trades you made, let them be confirmed by the trader you traded with and build reputation fast!

![Logo](misc/logo.png)

## General Information

* Ruby: `2.4.0`
* Rails: `5.0.2`
* [Postgresql](https://www.postgresql.org/): `9.6`
* Bootstrap: `3.3.7` ("Paper" theme by [bootswatch](http://bootswatch.com/))
* Maintained by [@siegy22](https://github.com/siegy22)

## Roles

There are currently 3 roles on the system:

* **admin**: Maintainers of this project.
* **donator**: This project takes a lot of money and effort to build and to maintain. You can donate to this project. If you'd like to become a donator you can do this by sending me an email: yves@siegrist.io
* **developer**: If you help to fix a bug you'll get this role. This is somehow like the [white hat in Rocket League](https://www.reddit.com/r/RocketLeague/comments/4p68hx/the_story_behind_the_tooper_white_hat/). But you'll get it with any fix, not only security related.

## Development

The workflow is the same as in every other rails application:

```bash
git clone git@github.com:siegy22/trading_reputation.git
cd trading_reputation
bin/setup
bin/rails server --port 3000
```

### Omniauth

This project uses omniauth to sign up/in (reddit) and connect accounts from different providers (like steam, discord etc.).

Every provider is configured in `config/initializers/devise.rb` at the bottom.

To store the secrets we use [dotenv-rails](https://github.com/bkeepers/dotenv), there's a sample called `.env.local.sample`. I created a test application on reddit so that you can sign in without configuring anything. The redirect URI of this test application is localhost:3000, so your rails application should run on port 3000.

## Testing

All tests can be run with the following command:

```bash
bin/rails test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siegy22/trading_reputation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
