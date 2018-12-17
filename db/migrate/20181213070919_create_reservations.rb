class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :book, null: false
      t.references :member, null: false
      t.date :app_date, null: false
      t.boolean :is_processed, null: false, default: false

      t.timestamps null: false
    end
  end
end
