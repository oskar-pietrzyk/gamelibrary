# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user).optional(true) }
    it { is_expected.to belong_to(:computer_game).optional(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }

    describe 'game progress' do
      it { is_expected.to allow_value(10.00).for(:game_progress) }
      it { is_expected.to_not allow_value(200.00).for(:game_progress) }
      it { is_expected.to_not allow_value(-20.00).for(:game_progress) }
    end
  end
end
