require 'securerandom'

module UniqIdentifier
  module Hook

    def uuid(*args, &block)
      if super(*args).nil?
        self.send(:uuid=, UniqIdentifier.configuration.generator.uuid)
      end

      super(*args)
    end

    def set_uniq_identifier
      self.uuid # Just call lazy loading
    end
  end
end
