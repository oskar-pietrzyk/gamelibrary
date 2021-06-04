# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    title { Faker::Game.title }
    game_progress { 10.00 }
    user
  end
end
