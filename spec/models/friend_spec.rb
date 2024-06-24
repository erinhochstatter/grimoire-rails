# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friend, type: :model do
  # include_examples 'valid_factory', :friend

  context 'associations' do
    it { is_expected.to have_many(:posts) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
  end
end