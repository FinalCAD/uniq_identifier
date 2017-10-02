require 'spec_helper'

describe UniqIdentifier do
  let(:user) { User.new }
  let(:fake_uuid) { SecureRandom.uuid }

  context 'all settings default' do
    let(:fake_uuid) { UniqIdentifier::FakeGenerator.uuid }

    let(:default_settings_class) { ClassGenerator.generate }

    it 'must set uuid for new record' do
      expect(default_settings_class.new.uuid).to be_eql fake_uuid
    end

    it 'must have callback method' do
      expect(default_settings_class.new).to respond_to :set_uniq_identifier
    end
  end

  context 'generator option' do
    let(:fake_uuid) { '0c6bbc03-a269-44e2-8075-f442e1aac0c1' }
    let(:default_uuid) { UniqIdentifier::FakeGenerator.uuid }
    let(:generator) { OpenStruct.new(uuid: fake_uuid) }

    let!(:custom_settings_class) { ClassGenerator.generate generator: generator }
    let!(:default_settings_class) { ClassGenerator.generate }
    let!(:nil_settings_class) { ClassGenerator.generate generator: nil }
    let!(:inherited_settings_class) { ::Class.new(custom_settings_class) }

    it 'must have different generator when some was given' do
      default_generator_current = default_settings_class.uniq_identifier_generator
      custom_generator_current = custom_settings_class.uniq_identifier_generator
      expect(default_generator_current).to_not be_eql custom_generator_current
    end

    it 'must use given generator' do
      expect(custom_settings_class.uniq_identifier_generator).to be_eql generator
    end

    it 'must accept nil as generator when option was given' do
      expect(nil_settings_class.uniq_identifier_generator).to be_eql nil
    end

    it 'must nil as generator can\'t raise error'  do
      expect { nil_settings_class.new.uuid }.to_not raise_exception
    end

    it 'inherited class must have parent generator' do
      inherited_generator = inherited_settings_class.uniq_identifier_generator
      custom_generator_current = custom_settings_class.uniq_identifier_generator
      expect(inherited_generator).to be_eql custom_generator_current
    end
  end

  context 'auto option' do
    let(:fake_uuid) { '0c6bbc03-a269-44e2-8075-f442e1aac0c1' }
    let(:default_uuid) { UniqIdentifier::FakeGenerator.uuid }
    let(:generator) { OpenStruct.new(uuid: fake_uuid) }

    let!(:custom_settings_class) { ClassGenerator.generate auto: false }
    let!(:default_settings_class) { ClassGenerator.generate }

    it 'disabled auto must not set uuid' do
      expect(custom_settings_class.new.uuid).to be_nil
    end

    it 'enabled auto must set uuid' do
      expect(default_settings_class.new.uuid).to_not be_nil
    end
  end

  context 'persistence' do
    let!(:default_settings_class) { ClassGenerator.generate generator: SecureRandom }

    it 'must save uuid and return it' do
      expect(default_settings_class.create!(name: 'example').uuid).to_not be_nil
    end

    it 'must not change uuid during save' do
      user = default_settings_class.new(name: 'example')
      expect { user.save! }.to_not change { user.uuid }
    end
  end
end
