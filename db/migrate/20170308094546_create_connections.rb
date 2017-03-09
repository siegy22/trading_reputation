class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :connections, :users
    add_index :connections, [:provider, :uid], unique: true
    add_index :connections, [:provider, :user_id], unique: true
  end
end
