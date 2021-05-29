class CreateComputers < ActiveRecord::Migration[6.1]
  def change
    create_table :computers do |t|
      t.string :name, null: false, default: ''
      t.uuid :uuid, null: false, unique: true

      t.timestamps
    end
  end
end
