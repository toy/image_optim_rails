# encoding: UTF-8

Gem::Specification.new do |s|
  s.name        = 'image_optim_rails'
  s.version     = '0.4.2'
  s.summary     = %q{Optimize image assets using image_optim}
  s.homepage    = "http://github.com/toy/#{s.name}"
  s.authors     = ['Ivan Kuchin']
  s.license     = 'MIT'

  s.rubyforge_project = s.name

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
  s.add_dependency 'rails'
  s.add_dependency 'sprockets'

  s.add_development_dependency 'image_optim_pack', '~> 0.2', '>= 0.2.2'
  s.add_development_dependency 'rspec', '~> 3.0'
  if RUBY_VERSION >= '2.2'
    s.add_development_dependency 'rubocop', '~> 0.59'
  end
end
