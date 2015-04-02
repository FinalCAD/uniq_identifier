require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/hook'
require_relative 'uniq_identifier/configure'
require_relative 'uniq_identifier/fake_generator'

module UniqIdentifier
  extend Configure

  def uniq_identifier
    include Hook
    after_initialize :set_uniq_identifier
    after_validation :set_uniq_identifier # Case of manual attempt to do a nil assignation 
  end
end
