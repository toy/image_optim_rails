# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'appraisal', *RUBY_VERSION < '2.3' ? ['< 2.3'] : ['>= 2.5']

if RUBY_VERSION >= '4'
  gem 'benchmark'
  gem 'logger'
  gem 'ostruct'
end
