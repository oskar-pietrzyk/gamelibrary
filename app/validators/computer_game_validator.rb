# frozen_string_literal: true

class ComputerGameValidator < ActiveModel::Validator
  def validate(computer_game)
    @computer_game = computer_game

    computer_game.errors.add(:base, 'Game does not have any computer to be installed on.') if computer_game.computer.blank?
    computer_game.errors.add(:base, 'User is not the owner of this computer.') unless user_is_computer_owner?
    computer_game.errors.add(:base, 'User is not the owner of this game or the game does not exist.') unless user_is_game_owner?
    computer_game.errors.add(:base, 'Computer is already used.') if computer_is_used?
    computer_game.errors.add(:base, 'Game is already installed on this computer.,') if game_is_installed?
  end

  private

  def user_is_computer_owner?
    @computer_game.user == @computer_game.computer.user
  end

  def user_is_game_owner?
    @computer_game.games.all? { |game| game.user == @computer_game.user }
  end

  def game_is_installed?
    @computer_game.games.all? { |game| game.computer_game.computer == @computer_game.computer }
  end

  def computer_is_used?
    ComputerGame.where(computer: @computer_game.computer.id).exists?
  end
end
