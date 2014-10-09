require 'securerandom'

module UniqIdentifier
  module Hook

    def self.included(base)
      base.extend(self)
    end

    def set_uniq_identifier
      self.send(:uuid=, UniqIdentifier.configuration.generator.uuid)
    end
  end
end