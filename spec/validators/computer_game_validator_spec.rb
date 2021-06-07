# frozen_string_literal: true

require 'rails_helper'

describe 'ComputerGameValidator' do
  let(:errors_message) { subject.errors.full_messages.join(', ') }
  let(:user) { create(:user) }
  let(:game) { create(:game, user: user) }

  context 'when computer does not exist' do
    let(:subject) { ComputerGame.create(user: user, games: [game]) }

    it { expect(subject).to_not be_valid }
    it { expect(errors_message).to eq('Computer is needed to install games.') }
  end

  context 'when user is not the owner of the computer' do
    let(:subject) { ComputerGame.create(user: user, games: [game], computer: computer) }
    let(:computer) { create(:computer, user: not_owner) }
    let(:not_owner) { create(:user) }

    it { expect(subject).to_not be_valid }
    it { expect(errors_message).to eq('User is not the owner of this computer.') }
  end

  context 'when user is not the owner of the game' do
    let(:subject) { ComputerGame.create(user: user, games: [game], computer: computer) }
    let(:computer) { create(:computer, user: user) }
    let(:game) { create(:game, user: not_owner) }
    let(:not_owner) { create(:user) }

    it { expect(subject).to_not be_valid }
    it { expect(errors_message).to eq('User is not the owner of this game or the game does not exist.') }
  end
end
