require 'uniq_identifier'
require 'bundler/setup'
require 'coveralls'

require 'rails/all'

require 'pry' rescue nil

require_relative './support/fake_generator'
require_relative './support/class_generator'

Coveralls.wear! rescue nil

ENV['ADAPTER'] ||= 'active_record'
load File.dirname(__FILE__) + "/support/adapters/#{ENV['ADAPTER']}.rb"

UniqIdentifier.configure do |conf|
  conf.generator = UniqIdentifier::FakeGenerator
end

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
