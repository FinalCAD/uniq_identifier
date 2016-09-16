source 'https://rubygems.org'

# Specify your gem's dependencies in uniq_identifier.gemspec
gemspec

group :test do
  case ENV['ADAPTER']
  when nil, 'active_record'
    gem 'sqlite3', platform: 'ruby'
    gem 'activerecord', '4.2.0'
  when 'mongoid'
    gem 'mongoid'
  else
    raise "Unknown model adapter: #{ENV["ADAPTER"]}"
  end
  gem 'coveralls', require: false
  gem 'pry'
  # gem 'ammeter'
end
