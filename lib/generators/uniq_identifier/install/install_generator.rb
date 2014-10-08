require 'rails/generators/active_record'

module UniqIdentifier
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      desc <<DESC
description :
    copy uniq_identifier configuration to an initializer.
DESC
      def copy_initializer_file
        template 'uniq_identifier.rb', "config/initializers/uniq_identifier.rb"
        migration_template 'migration.rb', "db/migrate/add_uuid_user.rb"
      end
    end
  end
end
