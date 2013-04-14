class ChangeUsernametoNameonUsers < ActiveRecord::Migration
  def up
    remove_column :users, :username
    add_column :users, :name, :string
  end

  def down
    remove_column :users, :name
    add_column :users, :username, :string
  end
end
