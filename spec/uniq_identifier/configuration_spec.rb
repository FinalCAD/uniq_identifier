require 'spec_helper'

module UniqIdentifier
  describe Configuration do

    describe '#default' do
      specify do
        expect(subject.generator).to eql(SecureRandom)
      end
    end
  end
end
