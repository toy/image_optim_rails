[![Gem Version](https://img.shields.io/gem/v/image_optim_rails?logo=rubygems)](https://rubygems.org/gems/image_optim_rails)
[![Check](https://img.shields.io/github/actions/workflow/status/toy/image_optim_rails/check.yml?label=check&logo=github)](https://github.com/toy/image_optim_rails/actions/workflows/check.yml)
[![Rubocop](https://img.shields.io/github/actions/workflow/status/toy/image_optim_rails/rubocop.yml?label=rubocop&logo=rubocop)](https://github.com/toy/image_optim_rails/actions/workflows/rubocop.yml)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/toy/image_optim_rails?logo=codeclimate)](https://codeclimate.com/github/toy/image_optim_rails)
[![Depfu](https://img.shields.io/depfu/toy/image_optim_rails)](https://depfu.com/github/toy/image_optim_rails)
[![Inch CI](https://inch-ci.org/github/toy/image_optim_rails.svg?branch=master)](https://inch-ci.org/github/toy/image_optim_rails)

# image\_optim\_rails

Optimize rails image assets using image_optim gem.

Options and instructions for getting binaries can be found in [image_optim readme](https://github.com/toy/image_optim).

## Installation

Add to your `Gemfile`:

```ruby
gem 'image_optim_rails'
```

With [`image_optim_pack`](https://github.com/toy/image_optim_pack):

```ruby
gem 'image_optim_rails'
gem 'image_optim_pack'
```

## Usage

`ImageOptim::Railtie` will automatically register sprockets preprocessor unless you set `config.assets.image_optim = false` or `config.assets.compress = false` (later for partial rails 3 compatibility).

You can provide options for image_optim used for preprocessor through config:

```ruby
config.assets.image_optim.nice = 20
config.assets.image_optim.svgo = false
config.assets.image_optim.gifsicle.careful = true
```

Or through config files `config/image_optim.yml` and `config/image_optim/#{RAILS_ENV}.yml`.

Caching is enabled by default in directory `tmp/cache/image_optim`.

Check all available options in [options section of image_optim](https://github.com/toy/image_optim#options).

## ChangeLog

In separate file [CHANGELOG.markdown](CHANGELOG.markdown).

## Copyright

Copyright (c) 2013-2022 Ivan Kuchin. See [LICENSE.txt](LICENSE.txt) for details.
