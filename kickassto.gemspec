Gem::Specification.new do |s|
  s.name        = 'kickassto'
  s.version     = '0.1.0'
  s.summary     = "Parsing and getting torrent infor from kickass.to"
  s.description = "Allows users to search and retrive any torrent data from Kickass.to"
  s.authors     = ["Lucas Gerbeaux"]
  s.email       = 'lucas.gerbeaux@gmail.com'
  s.files       = 'git ls-files'.split("\n")
  s.homepage    = %q{http://github.com/gbxl/kickassto}
  s.add_dependency("nokogiri")
  s.add_dependency("rest_client")
  s.require_path = 'lib'
  s.license      = 'MIT'
  s.date         = '2013-08-26'
end
