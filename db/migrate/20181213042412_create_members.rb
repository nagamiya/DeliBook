class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      t.string :place, null: false
      t.string :tel, null: false
      t.string :mail_address, null: false
      t.string :password, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
