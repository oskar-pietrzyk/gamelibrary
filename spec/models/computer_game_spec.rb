# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComputerGame, type: :model do
  let(:subject) { create(:computer_game, user: user, computer: computer, games: [game]) }
  let(:user) { create(:user) }
  let(:computer) { create(:computer, user: user) }
  let(:game) { create(:game, user: user) }

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:computer) }
    it { is_expected.to have_many(:games) }
  end
end
