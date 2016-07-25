class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :garage, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
