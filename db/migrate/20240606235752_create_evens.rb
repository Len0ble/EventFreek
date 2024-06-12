class CreateEvens < ActiveRecord::Migration[6.1]
  def change
    create_table :evens do |t|
      t.date :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location

      t.timestamps
    end
  end
end
