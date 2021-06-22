# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def greeting
    return I18n.t('user.greeting', username: "#{first_name} #{last_name}") if first_name? && last_name?

    I18n.t('user.greeting', username: email)
  end

  def installed_games
    games.where.not(computer_game_id: nil).count
  end

  def not_installed_games
    games.where(computer_game_id: nil).count
  end
end
