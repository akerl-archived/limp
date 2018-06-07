Gem::Specification.new do |s|
  s.name        = 'limp'
  s.version     = '0.0.3'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Chrome Slack token reader'
  s.description = 'Read Slack tokens from Chrome LocalStorage'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/limp'
  s.license     = 'MIT'

  s.executables = ['limp']
  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'fuubar', '~> 2.3.0'
  s.add_development_dependency 'goodcop', '~> 0.5.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.7.0'
  s.add_development_dependency 'rubocop', '~> 0.57.1'
end
