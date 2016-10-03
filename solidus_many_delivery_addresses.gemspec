# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_many_delivery_addresses/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_many_delivery_addresses'
  s.version     = SolidusManyDeliveryAddresses::VERSION
  s.summary     = 'An extension to handle many different delivery addresses for a single order'
  s.description = 'An extension to handle many different delivery addresses for a single order'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Berlimioz'
  s.email     = 'berlimioz@gmail.com'
  # s.homepage  = 'http://www.example.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus', '~> 1.3.1'
  s.add_dependency 'solidus_auth_devise'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
