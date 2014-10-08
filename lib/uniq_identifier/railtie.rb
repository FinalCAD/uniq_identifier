require 'uniq_identifier'
require 'rails'

module UniqIdentifier
  class Railtie < Rails::Railtie
    initializer 'uniq_identifier.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :extend, UniqIdentifier
      end

      config.before_initialize do
        ::Mongoid::Document.module_eval do
          def self.included(base)
            base.extend UniqIdentifier
          end
        end
      end if defined?(Mongoid)
    end
  end
end
