source 'https://rubygems.org'

# Specify your gem's dependencies in uniq_identifier.gemspec
gemspec

group :test do
  case ENV['ADAPTER']
  when nil, 'active_record'
    gem 'sqlite3', platform: 'ruby'
    gem 'activerecord', '>= 4.1.6', require: 'active_record'
  else
    raise "Unknown model adapter: #{ENV["ADAPTER"]}"
  end
  gem 'coveralls', require: false
  gem 'pry'
  gem 'generator_spec'
end
