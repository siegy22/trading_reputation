class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, unique: true
      t.string :image

      t.timestamps
    end
  end
end
