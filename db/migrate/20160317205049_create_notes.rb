class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :journal, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
