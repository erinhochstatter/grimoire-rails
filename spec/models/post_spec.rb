# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  include_examples 'valid_factory', :post

  context 'associations' do
    it { is_expected.to belong_to(:friend) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:kind) }
  end
end