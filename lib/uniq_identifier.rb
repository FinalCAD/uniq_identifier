require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/hook'
require_relative 'uniq_identifier/configure'
require_relative 'uniq_identifier/fake_generator'

module UniqIdentifier
  extend Configure

  def uniq_identifier
    include Hook
    before_validation :set_uniq_identifier
  end
end
