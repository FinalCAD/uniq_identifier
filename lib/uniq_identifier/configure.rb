require_relative 'configuration'

module UniqIdentifier
  module Configure

    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

  end
end
