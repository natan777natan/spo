class AddAccessTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :text
    add_column :users, :refresh_token, :text
  end
end
