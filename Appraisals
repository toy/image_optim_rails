# frozen_string_literal: true

def appgen(gems)
  description = gems.map{ |name, version| "#{name} #{version}" }.join(', ')
  appraise description do
    gems.each do |name, version|
      gem name, version
    end

    if RUBY_VERSION < '2.0'
      gem 'concurrent-ruby', '!= 1.1.1'
      gem 'rack-cache', '< 1.7.2'
      gem 'rake', '< 12.3'
    end

    if RUBY_VERSION < '2.1'
      gem 'nokogiri', '< 1.7'
    end

    gem 'tzinfo'

    gem 'sprockets-rails' if gems['railties'] != '~> 3.2' && !gems['sprockets-rails']
  end
end

if RUBY_VERSION < '2.4'
  appgen 'railties' => '~> 3.2'
end

if RUBY_VERSION >= '1.9' && RUBY_VERSION < '2.5'
  appgen 'railties' => '~> 4.0', 'sprockets-rails' => '~> 2.0'
  appgen 'railties' => '~> 4.0', 'sprockets' => '~> 3.0'
end

if RUBY_VERSION >= '2.3' && RUBY_VERSION < '2.7'
  appgen 'railties' => '~> 5.0', 'sprockets-rails' => '~> 2.0'
  appgen 'railties' => '~> 5.0', 'sprockets' => '~> 3.0'
  appgen 'railties' => '~> 5.0', 'sprockets' => '>= 4.0' if RUBY_VERSION >= '2.5'
end

if RUBY_VERSION >= '2.5'
  appgen 'railties' => '~> 6.0', 'sprockets-rails' => '~> 2.0'
  appgen 'railties' => '~> 6.0', 'sprockets' => '~> 3.0'
  appgen 'railties' => '~> 6.0', 'sprockets' => '>= 4.0'
end
