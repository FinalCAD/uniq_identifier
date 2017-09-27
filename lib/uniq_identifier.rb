require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/hook'
require_relative 'uniq_identifier/configure'

module UniqIdentifier
  extend Configure

  def uniq_identifier(auto: true, validate: true, generator: :default)
    prepend Hook

    class << self
      attr_accessor :uniq_identifier_generator
    end

    if auto
      after_initialize :set_uniq_identifier
    end

    if validate
      validates :uuid, presence: true, uniqueness: true
    end

    if generator == :default
      self.uniq_identifier_generator = UniqIdentifier.configuration.generator
    else
      self.uniq_identifier_generator = generator
    end
  end
end
