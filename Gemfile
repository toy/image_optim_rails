source 'https://rubygems.org'

gemspec

gem 'appraisal'

gem 'nokogiri', '< 1.7' if RUBY_VERSION < '2.1'
if RUBY_VERSION < '2.0'
  gem 'concurrent-ruby', '!= 1.1.1'
  gem 'rack-cache', '<= 1.8.0'
  gem 'rake', '< 12.3'
end

if RUBY_VERSION >= '2.0'
  gem 'travis_check_rubies', '~> 0.2'
end
