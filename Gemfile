# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'appraisal', *RUBY_VERSION < '2.3' ? ['< 2.3'] : []

if RUBY_VERSION >= '2.0'
  gem 'travis_check_rubies', '~> 0.2'
end
