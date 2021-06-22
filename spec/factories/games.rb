# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    title { Faker::Game.title }
    game_progress { 0 }
    user
  end

  trait :with_progress50 do
    game_progress { 50.00 }
  end

  trait :with_progress100 do
    game_progress { 100.00 }
  end
end
