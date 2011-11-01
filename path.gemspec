spec = Gem::Specification.new do |s|
  s.name = 'path'
  s.version = '0.1'
  s.authors     = ["Ricard Forniol Agustí"]
  s.summary = 'Let switch key files'
  s.files        = Dir.glob("{bin,lib}/**/*")
  s.executables  = ['rsakey']
  s.require_path = 'lib'
end