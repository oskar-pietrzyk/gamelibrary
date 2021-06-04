class AddComputerGameToComputers < ActiveRecord::Migration[6.1]
  def change
    add_reference :computers, :computer_game, foreign_key: true, unique: true
  end
end
