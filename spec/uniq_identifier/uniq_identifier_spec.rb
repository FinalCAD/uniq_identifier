require 'spec_helper'

describe UniqIdentifier do
  let(:user) { User.new }

  before do
    user.valid?
  end

  specify do
    expect(user.uuid).to match(/(.*)-(.*)-(.*)-(.*)-(.*)/)
  end

  context 'persistence' do
    let(:user_id) { user.id }

    before { user.save! }

    specify do
      expect(User.find(user_id).uuid).to match(/(.*)-(.*)-(.*)-(.*)-(.*)/)
    end
  end
end
