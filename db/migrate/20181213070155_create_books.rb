class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :isbn, null: false
      t.references :genre, null: false
      t.references :publisher, null: false
      t.integer :stock_num, null: false
      t.string :summary, null: false

      t.timestamps null: false
    end
  end
end
