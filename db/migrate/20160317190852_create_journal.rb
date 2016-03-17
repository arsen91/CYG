class CreateJournal < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end
