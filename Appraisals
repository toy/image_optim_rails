def appgen(gems)
  description = gems.map{ |name, version| "#{name} #{version}" }.join(', ')
  appraise description do
    gems.each do |name, version|
      gem name, version
    end
  end
end

if RUBY_VERSION < '2.3'
  appgen 'rails' => '~> 3.2'
end

if RUBY_VERSION >= '2.1'
  appgen 'rails' => '~> 4.0', 'sprockets-rails' => '~> 2.0'
  appgen 'rails' => '~> 4.0', 'sprockets' => '~> 3.0'
  appgen 'rails' => '~> 4.0', 'sprockets' => '>= 4.0.beta'
end

if RUBY_VERSION >= '2.2'
  appgen 'rails' => '~> 5.0', 'sprockets-rails' => '~> 2.0'
  appgen 'rails' => '~> 5.0', 'sprockets' => '~> 3.0'
  appgen 'rails' => '~> 5.0', 'sprockets' => '>= 4.0.beta'
end
