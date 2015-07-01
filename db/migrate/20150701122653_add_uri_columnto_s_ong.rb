class AddUriColumntoSOng < ActiveRecord::Migration
  def change
    add_column :songs, :uri, :string
  end
end
