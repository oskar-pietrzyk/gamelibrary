# frozen_string_literal: true

class User < ApplicationRecord
  has_many :computers, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :computer_games, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
