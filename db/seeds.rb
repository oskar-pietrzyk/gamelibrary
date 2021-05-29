# frozen_string_literal: true

50.times { User.find_or_create_by(email: Faker::Internet.email) }
User.all.each do |user|
  user.computers = [FactoryBot.create(:computer)]
end
