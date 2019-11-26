class AddGenreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :genre, :text
  end
end
