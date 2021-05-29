# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Computer, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user).optional(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
