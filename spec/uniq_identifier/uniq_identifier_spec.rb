require 'spec_helper'

describe UniqIdentifier do
  let(:user) { User.new }
  let(:fake_uuid) { SecureRandom.uuid }

  before do
    allow(UniqIdentifier).to receive_message_chain('configuration.generator.uuid') { fake_uuid }
  end

  specify 'lazy load' do
    expect {
      expect(user.uuid).to eql(fake_uuid)
    }.to change {
      user.attributes['uuid']
    }.from(nil).to(fake_uuid)
  end

  specify do
    expect {
      user.save!
    }.to change {
      user.attributes['uuid']
    }.from(nil).to(fake_uuid)
  end

  context 'persistence' do
    let(:user_id) { user.id }

    context 'set uuid on save' do
      before { user.save! }

      specify do
        expect(User.find(user_id).uuid).to eql(fake_uuid)
      end
    end

    context 'keep given uuid on save' do
      before do
        user.uuid = fake_uuid
        user.save!
      end

      specify do
        expect(User.find(user_id).uuid).to eql(fake_uuid)
      end
    end

    context 'keep given uuid on save' do
      before do
        user.attributes = { uuid: fake_uuid }
        user.save!
      end

      specify do
        expect(User.find(user_id).uuid).to eql(fake_uuid)
      end
    end

    context 'keep given uuid on save' do
      let(:user) { User.new({ uuid: fake_uuid }) }

      before { user.save! }

      specify do
        expect(User.find(user_id).uuid).to eql(fake_uuid)
      end
    end
  end
end
