require 'uniq_identifier/version'
require 'securerandom'
require_relative 'uniq_identifier/generator'

module UniqIdentifier

  def uniq_identifier
    include Generator
    after_initialize :set_uniq_identifier
  end
end
