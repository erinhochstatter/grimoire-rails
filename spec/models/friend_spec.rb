# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friend, type: :model do
  include_examples 'valid_factory', :friend

  context 'associations' do
    it { is_expected.to have_many(:posts) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:session_token) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }

    context 'uniqueness' do
      let!(:existing_friend) { create(:friend) }

      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
      it { is_expected.to validate_uniqueness_of(:session_token).case_insensitive }
    end
  end
end
