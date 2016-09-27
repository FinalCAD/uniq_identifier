require 'uniq_identifier'
require 'bundler/setup'
require 'coveralls'

require 'rails/all'

begin
  require 'pry'
rescue LoadError
end

Coveralls.wear!

ENV['ADAPTER'] ||= 'active_record'
load File.dirname(__FILE__) + "/support/adapters/#{ENV['ADAPTER']}.rb"

UniqIdentifier.configure do |conf|
  conf.generator = UniqIdentifier::FakeGenerator
end

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
