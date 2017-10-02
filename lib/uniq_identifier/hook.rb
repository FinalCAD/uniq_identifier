require 'securerandom'

module UniqIdentifier
  module Hook
    def uuid(*args, &block)
      generate_uniq_identifier! if super(*args, &block).nil?
      super
    end

    def set_uniq_identifier
      generate_uniq_identifier! if self.uuid.nil?
    end

    def generate_uniq_identifier!
      if self.class.uniq_identifier_generator.respond_to?(:uuid)
        self.uuid = self.class.uniq_identifier_generator.uuid
      end
    end
  end
end
