class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :book_id, null: false
      t.references :member_id, null: false
      t.date :app_date, null: false
      t.boolean :is_processed, null: false, default: false

      t.timestamps null: false
    end
  end
end
