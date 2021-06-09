# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def greeting
    if first_name? && last_name?
      I18n.t('user.greeting', user: "#{first_name} #{last_name}")
    else
      I18n.t('user.greeting', user: email)
    end
  end

  def installed_games
    games.where.not(computer_game_id: nil).count
  end

  def not_installed_games
    games.where(computer_game_id: nil).count
  end
end
