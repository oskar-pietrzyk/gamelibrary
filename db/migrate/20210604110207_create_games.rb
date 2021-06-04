class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title, null: false, default: ''
      t.decimal :game_progress, precision: 5, scale: 2

      t.timestamps
    end
  end
end
