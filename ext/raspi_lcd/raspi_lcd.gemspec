Gem::Specification.new do |s|
  s.name        = 'raspi_lcd'
  s.version     = '0.0.1'
  s.date        = '2013-05-03'
  s.summary     = "Ruby bindings for the Raspberry Pi LCD interface"
  s.description = "Ruby bindings for the Raspberry Pi LCD interface"
  s.authors     = ["Till Mossakowski"]
  s.email       = 'till@communtu.org'
  s.files       = Dir.glob('lib/**/*.rb') +
                  Dir.glob('ext/**/*.{c,h,rb}')
  s.extensions  = ['ext/raspi_lcd/extconf.rb']
  s.executables = ['hola']
  s.homepage    = 'https://github.com/tillmo/raspi_lcd'
end
