require 'rubygems'
require 'bundler/setup'

require 'uniq_identifier'

begin
  require 'pry'
rescue LoadError
end

require 'coveralls'
Coveralls.wear_merged!

ENV['ADAPTER'] ||= 'active_record'

if ENV['ADAPTER'] == 'active_record'
  require 'active_record/railtie'
else
  require 'mongoid'
end

module TestApp
  class Application < ::Rails::Application
    config.root = File.dirname(__FILE__)
  end
end

require 'ammeter'
require 'ammeter/init'

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
