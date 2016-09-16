require 'spec_helper'

describe UniqIdentifier do
  let(:user) { User.new }

  specify 'lazy load' do
    expect {
      expect(user.uuid).to eql('0c6bbc03-a269-44e2-8075-f442e1aac0c8')
    }.to change {
      user.attributes['uuid']
    }.from(nil).to('0c6bbc03-a269-44e2-8075-f442e1aac0c8')
  end

  specify do
    expect {
      user.save!
    }.to change {
      user.attributes['uuid']
    }.from(nil).to('0c6bbc03-a269-44e2-8075-f442e1aac0c8')
  end

  context 'persistence' do
    let(:user_id) { user.id }

    context 'set uuid on save' do
      before { user.save! }

      specify do
        expect(User.find(user_id).uuid).to eql('0c6bbc03-a269-44e2-8075-f442e1aac0c8')
      end
    end

    context 'keep given uuid on save' do
      before do
        user.uuid = 'What Ever Uuid'
        user.save!
      end

      specify do
        expect(User.find(user_id).uuid).to eql('What Ever Uuid')
      end
    end

    context 'keep given uuid on save' do
      before do
        user.attributes = { uuid: 'What Ever Uuid' }
        user.save!
      end

      specify do
        expect(User.find(user_id).uuid).to eql('What Ever Uuid')
      end
    end

    context 'keep given uuid on save' do
      let(:user) { User.new({ uuid: 'What Ever Uuid' }) }

      before { user.save! }

      specify do
        expect(User.find(user_id).uuid).to eql('What Ever Uuid')
      end
    end
  end
end
