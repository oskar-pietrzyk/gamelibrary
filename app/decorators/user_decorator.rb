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
end
