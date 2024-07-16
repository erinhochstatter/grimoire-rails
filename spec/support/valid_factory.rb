# frozen_string_literal: true

RSpec.shared_examples 'valid_factory' do |factory_name, *traits|
  context ['factory:', traits.join(', '), factory_name].join(' ') do
    subject { build(factory_name, *traits) }

    it 'is valid' do
      subject.valid?
      expect(subject.errors.messages).to eq({})
      expect { subject.save! }.to_not raise_error
    end
  end
end