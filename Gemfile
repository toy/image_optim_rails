source 'https://rubygems.org'

gemspec

%w[
  rails
  sprockets
  sprockets-rails
].each do |gem_name|
  version = ENV[gem_name.tr('-', '_').upcase + '_VERSION']
  gem gem_name, version if version
end

if RUBY_VERSION >= '2.0'
  gem 'travis_check_rubies', '~> 0.2'
end
