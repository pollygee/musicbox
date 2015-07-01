class AddAuthDataColumnToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :spotify_data, :text
  end
end
