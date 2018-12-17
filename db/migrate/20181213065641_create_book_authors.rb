class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.references :book, null: false
      t.references :author, null: false

      t.timestamps null: false
    end
  end
end
