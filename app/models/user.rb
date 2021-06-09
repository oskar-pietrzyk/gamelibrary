# frozen_string_literal: true

class User < ApplicationRecord
  has_many :computers, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :computer_games, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def search_computers(params)
    ComputerSearchService.call(params, resource: self)
  end

  def search_games(params)
    GameSearchService.call(params, resource: self)
  end
end
