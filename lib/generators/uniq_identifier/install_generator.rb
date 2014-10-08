module UniqIdentifier
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      desc <<DESC
description :
    copy uniq_identifier configuration to an initializer.
    rails generate uniq_identifier:install
DESC
      def copy_initializer_file
        template 'uniq_identifier.rb', "config/initializers/uniq_identifier.rb"
      end
    end

  end
end
