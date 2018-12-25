class PasswordOptionNull < ActiveRecord::Migration
  def change
    change_column :members, :password, :string, null: false
  end
end
