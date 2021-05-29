# frozen_string_literal: true

FactoryBot.define do
  factory :computer do
    name { Faker::Name.name }
  end
end
