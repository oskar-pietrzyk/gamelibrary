class AddComputerGameToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :computer_game, foreign_key: true
  end
end
