# frozen_string_literal: true

50.times { FactoryBot.create(:user) }
User.all.each do |user|
  user.computers = FactoryBot.create_list(:computer, rand(1..4))
  user.games = FactoryBot.create_list(:game, rand(1..100))
end
