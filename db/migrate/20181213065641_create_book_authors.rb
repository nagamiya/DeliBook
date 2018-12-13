class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.references :book_id, null: false
      t.references :author_id, null: false

      t.timestamps null: false
    end
  end
end
