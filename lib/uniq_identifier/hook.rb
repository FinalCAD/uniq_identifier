require 'securerandom'

module UniqIdentifier
  module Hook
    def set_uniq_identifier
      if self.uuid.nil? && self.class.uniq_identifier_generator.respond_to?(:uuid)
        self.uuid = self.class.uniq_identifier_generator.uuid
      end
      self.uuid # Just call lazy loading
    end
  end
end
