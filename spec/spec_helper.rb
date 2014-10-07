require 'uniq_identifier'
require 'bundler/setup'
require 'coveralls'

begin
  require 'pry'
rescue LoadError
end

Coveralls.wear!

ENV['ADAPTER'] ||= 'active_record'
load File.dirname(__FILE__) + "/support/adapters/#{ENV['ADAPTER']}.rb"

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
