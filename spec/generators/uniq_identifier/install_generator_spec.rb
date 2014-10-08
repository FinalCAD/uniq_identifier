# require 'rails/generators'
require 'generators_helper'

# Generators are not automatically loaded by Rails
require_relative '../../../lib/generators/uniq_identifier/install/install_generator'

module UniqIdentifier
  module Generators
    describe InstallGenerator do
      # Tell the generator where to put its output (what it thinks of as Rails.root)
      destination File.expand_path('../../../../tmp', __FILE__)
      # destination File.expand_path("../../../../tmp", __FILE__)

      before do
        prepare_destination
        # run_generator
      end

      # it 'should run all tasks in the generator' do
      #   gen = generator ['install']
      #   gen.should_receive :install
      #   # gen.should_receive :create_fixture_file
      #   capture(:stdout) { gen.invoke_all }
      # end

      after do
        FileUtils.rm_rf destination_root
      end

      describe 'the generated files' do
        before do
          run_generator ['install']
        end
        describe 'the spec' do
          let(:file_path) { 'config/initializers/uniq_identifier.rb' }
          # file - gives you the absolute path where the generator will create the file
          subject { file(file_path) }
          # is_expected_to exist - verifies the file exists
          # it { is_expected_to exist }
          specify do
            # binding.pry

            expect(File.exists?("#{destination_root}/#{file_path}")).to be_truthy

          end
          # it { is_expected_to contain /require 'spec_helper'/ }
      # it { is_expected_to contain /describe Posts/ }
        end
      end
    end
  end
end

#
#       # is_expected_to contain - verifies the file's contents
#       it { is_expected_to contain /require 'spec_helper'/ }
#       it { is_expected_to contain /describe Posts/ }
#     end
#
#       specify do
#         expect(destination_root).to have_structure do
#           no_file 'uniq_identifier.rb'
#           directory 'config' do
#             directory 'initializers' do
#               file 'uniq_identifier.rb' do
#                 contains 'UniqIdentifier.configure'
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end
