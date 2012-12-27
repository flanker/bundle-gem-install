Gem::Specification.new do |s|
  s.name        = 'bundle-gem-install'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['Feng Zhichao']
  s.email       = ['flankerfc@gmail.com']
  s.homepage    = 'http://www.chaojiwudi.com'
  s.summary     = %q{a bundle install wrapper which uses `gem install` to install the missing gems}

  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_runtime_dependency 'bundler', '~> 1.1.1'

  s.files              = ['./lib/bundle-gem-install/cli.rb']
  s.require_paths      = ['lib']
  s.executables        = %w(bundle)
end
