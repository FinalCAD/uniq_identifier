require_relative 'uniq_identifier/railtie' if defined?(Rails)
require_relative 'uniq_identifier/hook'
require_relative 'uniq_identifier/configure'
require_relative 'uniq_identifier/fake_generator'

module UniqIdentifier
  extend Configure

  def uniq_identifier
    prepend Hook
    before_save :set_uniq_identifier
    validates :uuid, presence: true, uniqueness: true
  end
end
