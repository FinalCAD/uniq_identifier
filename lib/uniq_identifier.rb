require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/generator'
require_relative 'uniq_identifier/configure'

module UniqIdentifier
  extend Configure

  def uniq_identifier
    include Generator
    after_initialize :set_uniq_identifier
  end
end
