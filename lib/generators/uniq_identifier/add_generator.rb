require 'rails/generators/active_record' if defined?(ActiveRecord)
require 'rails/generators/migration'

module UniqIdentifier
  module Generators
    class AddGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration
      class_option :orm, type: :string, default: :active_record

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      desc <<DESC
description :
  add migration file to choosen model
  rails generate uniq_identifier:add model_name --orm=mongoid
  rails generate uniq_identifier:add model_name
DESC
      def add_migration_file
        migration_template 'migration.rb', "db/migrate/add_uuid_#{file_path}.rb" if options.orm == :active_record

        hook   = 'uniq_identifier'
        data   = "\n"
        data += indent("#{hook}")

        if options.orm == 'mongoid'
          data += "\n"
          data += indent("field :uuid, type: String")
        end

        if options.orm == :active_record
          header = "class #{class_name} < ActiveRecord::Base"
        else
          header = 'include Mongoid::Document'
        end

        model_path = File.join('app', 'models', "#{file_path}.rb")
        inject_into_file model_path, data, after: header, verbose: true

        readme("./README-#{options.orm}")
      end
    end

  end
end
