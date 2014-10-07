module UniqIdentifier
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc <<DESC
description :
    copy uniq_identifier configuration to an initializer.
DESC
      def create_configuration
        template 'uniq_identifier.rb', 'config/initializers/uniq_identifier.rb'
      end
    end
  end
end
