# frozen_string_literal: true

50.times { FactoryBot.create(:user) if User.count < 50 }
User.all.each do |user|
  user.computers = FactoryBot.create_list(:computer, rand(1..4)) if user.computers.count <= 4
  user.games = FactoryBot.create_list(:game, rand(1..100)) if user.games.count <= 4
end
