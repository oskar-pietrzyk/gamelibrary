# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:computers) }
    it { is_expected.to have_many(:games) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
