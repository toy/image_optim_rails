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
  end
end

if RUBY_VERSION < '2.3'
  appgen 'rails' => '~> 3.2'
end

if RUBY_VERSION >= '2.1'
  appgen 'rails' => '~> 4.0', 'sprockets-rails' => '~> 2.0'
  appgen 'rails' => '~> 4.0', 'sprockets' => '~> 3.0'
end

if RUBY_VERSION >= '2.2'
  appgen 'rails' => '~> 5.0', 'sprockets-rails' => '~> 2.0'
  appgen 'rails' => '~> 5.0', 'sprockets' => '~> 3.0'
  appgen 'rails' => '~> 5.0', 'sprockets' => '>= 4.0.beta'
end
