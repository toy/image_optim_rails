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
