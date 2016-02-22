class CreateWorkingTimes < ActiveRecord::Migration
  def change
    create_table :working_times do |t|
      t.date :open_time
      t.date :close_time
      t.string :closed_days

      t.timestamps null: false
    end
  end
end
