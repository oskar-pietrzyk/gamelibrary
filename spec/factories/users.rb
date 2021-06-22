# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
  end

  trait :with_first_name do
    first_name { Faker::Name.first_name }
  end

  trait :with_last_name do
    last_name { Faker::Name.last_name }
  end

  trait :with_full_name do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
