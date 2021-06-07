# frozen_string_literal: true

class ComputerGameValidator < ActiveModel::Validator
  def validate(computer_game)
    @computer_game = computer_game

    if computer_game.computer.blank?
      computer_game.errors.add(:base, 'Computer is needed to install games.')
    else
      computer_game.errors.add(:base, 'User is not the owner of this computer.') unless user_is_computer_owner?
      computer_game.errors.add(:base, 'User is not the owner of this game or the game does not exist.') unless user_is_game_owner?
    end
  end

  private

  def user_is_computer_owner?
    @computer_game.user == @computer_game.computer.user unless @computer_game.computer.nil?
  end

  def user_is_game_owner?
    @computer_game.games.all? { |game| game.user == @computer_game.user }
  end
end
