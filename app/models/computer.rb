# frozen_string_literal: true

class Computer < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true

  before_create :generate_uuid

  private

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
