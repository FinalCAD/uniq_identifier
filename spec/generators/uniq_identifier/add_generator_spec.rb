require 'spec_helper'

require 'rails/generators'
require 'ammeter/init'

# Generators are not automatically loaded by Rails
require_relative '../../../lib/generators/uniq_identifier/add_generator'

module UniqIdentifier
  module Generators
    describe AddGenerator do
      # Tell the generator where to put its output (what it thinks of as Rails.root)
      destination File.expand_path('../../../../tmp', __FILE__)
      let(:user_content) do
        <<-CONTENT
class User < ActiveRecord::Base
end
        CONTENT
      end
      before do
        prepare_destination
        FileUtils.mkdir_p "#{destination_root}/app/models"
        File.open("#{destination_root}/app/models/user.rb", 'w+') do |file|
          file.write(user_content)
        end
      end

      after do
        FileUtils.rm_rf destination_root
      end

      describe 'the generated files' do
        before do
          expect(AddGenerator).to receive(:next_migration_number) { '20141008141816' }
          run_generator ['User']
        end
        describe 'the spec' do
          let(:file_path) { 'db/migrate/20141008141816_add_uuid_user.rb' }

          subject { file(file_path) }

          specify do
            expect(File.exists?("#{destination_root}/#{file_path}")).to be_truthy
          end
        end
      end
    end
  end
end
