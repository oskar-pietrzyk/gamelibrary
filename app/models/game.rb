# frozen_string_literal: true

class Game < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :user, optional: true
  belongs_to :computer_game, optional: true

  validates :title, presence: true
  validates :game_progress, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def percentage_game_progress
    number_to_percentage(game_progress, precision: 2)
  end
end
