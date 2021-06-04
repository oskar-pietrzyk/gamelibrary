class CreateComputerGames < ActiveRecord::Migration[6.1]
  def change
    create_table :computer_games do |t|
      t.references :user, forgein_key: true 

      t.timestamps
    end
  end
end
