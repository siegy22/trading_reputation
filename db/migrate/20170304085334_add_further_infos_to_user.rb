class AddFurtherInfosToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reddit_uid, :string, required: true
    add_column :users, :reddit_name, :string, required: true
    add_column :users, :name, :string, required: true
    add_column :users, :old_rep_comment, :string
  end
end
