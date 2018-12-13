class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
