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

UniqIdentifier.configure do |conf|
  conf.generator = begin
    Class.new do
      def self.uuid
        "0c6bbc03-a269-44e2-8075-f442e1aac0c8"
      end
    end
  end
end

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
