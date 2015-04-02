require 'securerandom'

module UniqIdentifier
  module Hook

    def self.included(base)
      base.extend(self)
    end

    def set_uniq_identifier
      if self.respond_to?(:uuid)
        unless self.uuid?
          self.send(:uuid=, UniqIdentifier.configuration.generator.uuid)
        end
      end
    end
  end
end
