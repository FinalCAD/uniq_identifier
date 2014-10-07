require 'rails/generators'
require 'generator_spec'

# Generators are not automatically loaded by Rails
require_relative '../../../../lib/generators/uniq_identifier/install/install_generator'

module UniqIdentifier
  module Generators
    describe InstallGenerator do
      # Tell the generator where to put its output (what it thinks of as Rails.root)
      destination File.expand_path('../../../../tmp', __FILE__)

      before do
        prepare_destination
        run_generator
      end

      after do
        FileUtils.rm_rf destination_root
      end

      specify do
        expect(destination_root).to have_structure do
          no_file 'uniq_identifier.rb'
          directory 'config' do
            directory 'initializers' do
              file 'uniq_identifier.rb' do
                contains 'UniqIdentifier.configure'
              end
            end
          end
        end
      end
    end
  end
end
