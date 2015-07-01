class AddVotesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :votes_left, :integer
  end
end
