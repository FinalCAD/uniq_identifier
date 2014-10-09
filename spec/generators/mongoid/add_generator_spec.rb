require 'spec_helper'

require 'rails/generators'
require 'ammeter/init'

# Generators are not automatically loaded by Rails
require_relative '../../../lib/generators/uniq_identifier/add_generator'

module UniqIdentifier
  module Generators
    describe AddGenerator, skip: true do
      # Tell the generator where to put its output (what it thinks of as Rails.root)
      destination File.expand_path('../../../../tmp', __FILE__)
      let(:user_content) do
        <<-CONTENT
class User
  include Mongoid::Document
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
          run_generator ['User', '--orm=mongoid']
        end

        describe 'add hook' do
          let(:file_path) { 'app/models/user.rb' }
          subject { file(file_path) }
          specify do
            expect(File.new(file_path)).to match(/uniq_identifier/)
          end
        end
      end
    end
  end
end
