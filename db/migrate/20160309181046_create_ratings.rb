class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :garage, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
