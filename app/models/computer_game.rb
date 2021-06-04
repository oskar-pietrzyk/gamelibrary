# frozen_string_literal: true

class ComputerGame < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  has_one :computer, dependent: :destroy
  has_many :games, dependent: :destroy

  validates_with ComputerGameValidator
end
