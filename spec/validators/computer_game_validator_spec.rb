# frozen_string_literal: true

require 'rails_helper'

describe 'ComputerGameValidator' do
  context 'when computer does not exist' do
    let(:subject) { ComputerGame.new(user: user, games: [game]) }
    let(:user) { create(:user) }
    let(:game) { create(:game, user: user) }

    it { expect(subject).to_not be_valid }
  end
end

# computer_game.errors.add(:base, 'Game does not have any computer to be installed on.') if computer_game.computer.blank?
# computer_game.errors.add(:base, 'User is not the owner of this computer.') unless user_is_computer_owner?
# computer_game.errors.add(:base, 'User is not the owner of this game or the game does not exist.') unless user_is_game_owner?
# computer_game.errors.add(:base, 'Computer is already used.') if computer_is_used?
