require 'securerandom'

module UniqIdentifier
  class Configuration
    attr_accessor :generator

    def initialize
      self.generator = SecureRandom
    end
  end
end
