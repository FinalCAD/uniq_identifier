require 'mongoid'

Mongoid.load!('spec/support/adapters/mongoid.yml', :test)

::Mongoid::Document.module_eval do
  def self.included(base)
    base.extend UniqIdentifier
  end
end

class User
  include Mongoid::Document
  uniq_identifier

  field :name, type: String
  field :uuid, type: String
end
