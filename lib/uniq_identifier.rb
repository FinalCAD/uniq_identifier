require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/generator'
require_relative 'uniq_identifier/configuration'

module UniqIdentifier

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def uniq_identifier
    include Generator
    after_initialize :set_uniq_identifier
  end
end
