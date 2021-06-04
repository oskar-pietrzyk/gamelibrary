# frozen_string_literal: true

class Computer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :computer_game, optional: true

  validates :name, presence: true
  validates :computer_game, uniqueness: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
