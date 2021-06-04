# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user).optional(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to allow_value(10.00).for(:game_progress) }
    it { is_expected.to_not allow_value(200.00).for(:game_progress) }
    it { is_expected.to_not allow_value(-20.00).for(:game_progress) }
  end
end
