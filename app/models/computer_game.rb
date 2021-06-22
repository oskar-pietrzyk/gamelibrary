# frozen_string_literal: true

class ComputerGame < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  has_one :computer, dependent: :destroy
  has_many :games, dependent: :destroy

  validates_with ComputerGameValidator
  validate :computer_is_used, on: :create

  private

  def computer_is_used
    errors.add(:base, :computer_alerady_used) if ComputerGame.where(computer: computer).any?
  end
end
