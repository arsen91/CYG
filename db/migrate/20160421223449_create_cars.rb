class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :color
      t.references :user, index: true, foreign_key: true
      t.datetime :year
      t.string :fuel

      t.timestamps null: false
    end
  end
end
