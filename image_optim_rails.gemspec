# encoding: UTF-8

Gem::Specification.new do |s|
  s.name        = 'image_optim_rails'
  s.version     = '0.5.0'
  s.summary     = %q{Optimize image assets using image_optim}
  s.homepage    = "https://github.com/toy/#{s.name}"
  s.authors     = ['Ivan Kuchin']
  s.license     = 'MIT'

  s.metadata = {
    'bug_tracker_uri'   => "https://github.com/toy/#{s.name}/issues",
    'changelog_uri'     => "https://github.com/toy/#{s.name}/blob/master/CHANGELOG.markdown",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}/#{s.version}",
    'source_code_uri'   => "https://github.com/toy/#{s.name}",
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w[lib]

  s.add_dependency 'image_optim', '~> 0.24'
  s.add_dependency 'railties'
  s.add_dependency 'sprockets'

  s.add_development_dependency 'image_optim_pack', '~> 0.2', '>= 0.2.2'
  s.add_development_dependency 'rspec', '~> 3.0'
  if RUBY_VERSION >= '2.5'
    s.add_development_dependency 'rubocop', '~> 1.22', '!= 1.22.2'
    s.add_development_dependency 'rubocop-rspec', '~> 2.0'
  end
end
