class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
