Gem::Specification.new do |s|
  s.name = 's44_myweatherforecast'
  s.version = '0.1.2'
  s.summary = 'Under development: Uses the myweatherforecast gem to generate a summary of the weather forecast in plain English.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/s44_myweatherforecast.rb']
  s.signing_key = '../privatekeys/s44_myweatherforecast.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/s44_myweatherforecast'
end
