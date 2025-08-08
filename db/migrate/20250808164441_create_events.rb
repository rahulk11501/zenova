class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capacity
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
