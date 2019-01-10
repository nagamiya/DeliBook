class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :members, :password, :hashed_password
  end
end
