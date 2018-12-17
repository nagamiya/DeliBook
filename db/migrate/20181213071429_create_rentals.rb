class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :book, null: false
      t.references :member, null: false
      t.date :rent_date, null: false
      t.date :return_date
      t.boolean :is_delivered, null: false, default: false

      t.timestamps null: false
    end
  end
end
